import configparser
import os
from time import sleep
import services.chain_prompt as chain
import services.utils as utility
import services.dafny_verifyer as verifier
import services.example_selectors as exp_selectors


def get_config():
    script_dir_path = os.path.dirname(os.getcwd())
    config_path = os.path.join(script_dir_path, 'env.config')
    if not (os.path.exists(config_path)):
        print("env.config not found!!")
        return
    config = configparser.ConfigParser()
    config.read(config_path)

    _api_config = dict()
    _api_config["model"] = config.get('DEFAULT', 'model')
    _api_config["openai_api_key"] = config.get('DEFAULT', 'openai_api_key')
    _api_config["google_api_key"] = config.get('DEFAULT', 'google_api_key')
    _api_config["temp"] = float(config.get('DEFAULT', 'temp'))

    _env_config = dict()
    _env_config["K_run"] = config.get('DEFAULT', 'K_run')
    _env_config["cool_down_time"] = config.get('DEFAULT', 'cool_down_time')
    _env_config["data_path"] = config.get('DEFAULT', 'data_path')
    _env_config["base_output_path"] = config.get('DEFAULT', 'base_output_path')

    _env_config["example_db_json_path"] = config.get('FEWSHOT', 'example_db_json_path')
    _env_config["spec_shot_count"] = config.get('FEWSHOT', 'spec_shot_count')
    _env_config["code_shot_count"] = config.get('FEWSHOT', 'code_shot_count')

    return _api_config, _env_config


def get_output_paths(_task, _temp, _K, _model, _base_path):
    out_paths = dict()
    common_path = "task_id" + "_" + str(_task['task_id']) + "-" + _model + "-" + "temp_" + str(
        _temp) + "-" + "k_" + str(_K)
    out_paths["saved_path"] = os.path.join(_base_path, common_path + ".json")
    out_paths["dfy_src_path"] = os.path.join(_base_path, common_path + ".dfy")
    out_paths["verification_path"] = os.path.join(_base_path, common_path + "_verification_log.txt")
    return out_paths


def prepare_model_response(_task, _temp, _K, _model, _dafny_code, _isVerified, _verification_bits, _saved_map):
    return {
        "id": _task['task_id'],
        "K": _K,
        "temperature": _temp,
        "task_id": _task['task_id'],
        "task_description": _task['task_description'],
        "model": _model,
        "dafny_code": _dafny_code,
        "isVerified": _isVerified,
        "verification_bits": _verification_bits,
        "spec_example_shots": _saved_map["spec_example_shots"],
        "specification_response": _saved_map["specification_response"],
        "code_example_shots": _saved_map["code_example_shots"],
        "code_response": _saved_map["code_response"],
        "code_examples_ids": _saved_map["code_examples_ids"],
        "spec_examples_ids": _saved_map["spec_examples_ids"]
    }


def get_spec_code_prompts():
    script_dir_path = os.path.dirname(os.getcwd())
    spec_prompt_path = os.path.join(script_dir_path, 'prompts/COT_SPEC_TEMPLATE.file')
    code_prompt_path = os.path.join(script_dir_path, 'prompts/COT_CODE_TEMPLATE.file')
    if not (os.path.exists(spec_prompt_path) or os.path.exists(code_prompt_path)):
        print("prompts/COT_SPEC_TEMPLATE.file or  prompts/COT_CODE_TEMPLATE.file not found!!")
        return
    spec_template = utility.read_file(spec_prompt_path)
    code_template = utility.read_file(code_prompt_path)
    return spec_template, code_template


def execute_dynamic_few_shot_cot_prompt(_api_config, _env_config):
    # load example db
    example_db_tasks = utility.load_json(_env_config['example_db_json_path'])
    # prepare all example db for embedding
    examples_db_for_spec_prompt = utility.get_examples_db_task_id_des_pair(example_db_tasks)
    examples_db_for_cot_prompt = utility.get_examples_id_task_specification_pair(example_db_tasks)
    spec_prompt_template, code_prompt_template = get_spec_code_prompts()

    # 228 task json path
    all_response = []
    tasks = utility.load_json(_env_config['data_path'])
    model = _api_config['model']

    spec_example_selector = exp_selectors.get_semantic_similarity_example_selector(
        _api_config['openai_api_key'], _example_db_tasks=examples_db_for_spec_prompt,
        number_of_similar_tasks=_env_config['spec_shot_count'])

    code_example_selector = exp_selectors.get_semantic_similarity_example_selector(
        _api_config['openai_api_key'], _example_db_tasks=examples_db_for_cot_prompt,
        number_of_similar_tasks=_env_config['code_shot_count'])

    for t in tasks:
        task = tasks[t]
        task_spec = {
            "task_id": task['task_id'],
            "task_description": task['task_description'],
            "method_signature": task['method_signature']
        }
        for run_count in range(1, int(_env_config["K_run"]) + 1):
            output_paths = get_output_paths(_task=task_spec, _temp=_api_config["temp"], _K=run_count,
                                            _model=model,
                                            _base_path=_env_config["base_output_path"])

            try:

                saved_response = chain.run_chain(_api_config, _env_config, new_task=task_spec,
                                                 _example_db_50_tasks=example_db_tasks,
                                                 spec_example_selector=spec_example_selector,
                                                 code_example_selector=code_example_selector,
                                                 spec_prompt_template=spec_prompt_template,
                                                 code_prompt_template=code_prompt_template)

                isVerified, parsedCode = verifier.verify_dfy_src(saved_response['code_response'],
                                                                 output_paths['dfy_src_path'],
                                                                 output_paths['verification_path'])
                verification_bits = verifier.get_all_verification_bits_count(parsedCode)
                saved_map = prepare_model_response(_task=task_spec, _temp=_api_config['temp'], _K=run_count,
                                                   _model=model, _dafny_code=parsedCode, _isVerified=isVerified,
                                                   _verification_bits=verification_bits, _saved_map=saved_response)
                if isVerified:
                    utility.save_to_json(saved_map, output_paths["saved_path"])
                    all_response.append(saved_map)
                    print("Task:" + task['task_id'] + " Verified @K=" + str(run_count) + ", saved, ignore next runs.")
                    break
                if run_count == int(_env_config["K_run"]):
                    all_response.append(saved_map)
                utility.save_to_json(saved_map, output_paths["saved_path"])
                print("Task:" + task['task_id'] + " Not Verified, saved, continue next runs.")
            except Exception as e:
                print("Error while processing => " + task['task_id'] + "in temperature =>" + str(
                    _api_config['temp']) + str(e))
            sleep(int(_env_config['cool_down_time']))
    utility.save_to_json(all_response,
                         os.path.join(_env_config["base_output_path"],
                                      "rq3-dynamic-few-shot-prompting-" + model + ".json"))


if __name__ == '__main__':
    api_config, env_config = get_config()
    execute_dynamic_few_shot_cot_prompt(api_config, env_config)
    print("Done")
