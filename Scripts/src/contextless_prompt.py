import os
import openai
from time import sleep
import configparser
import services.utils as utility
import src.services.dafny_verifyer as verifier
import google.generativeai as palm


def get_config():
    script_dir_path = os.path.dirname(os.getcwd())
    config_path = os.path.join(script_dir_path, 'env.config')
    if not (os.path.exists(config_path)):
        print("env.config not found!!")
        return
    config = configparser.ConfigParser()
    config.read(config_path)

    api_config = dict()
    api_config["openai_api_key"] = config.get('DEFAULT', 'openai_api_key')
    api_config["google_api_key"] = config.get('DEFAULT', 'google_api_key')
    api_config["model"] = config.get('DEFAULT', 'model')
    api_config["temp"] = float(config.get('DEFAULT', 'temp'))

    env_config = dict()
    env_config["K_run"] = config.get('DEFAULT', 'K_run')
    env_config["cool_down_time"] = config.get('DEFAULT', 'cool_down_time')
    env_config["data_path"] = config.get('DEFAULT', 'data_path')
    env_config["base_output_path"] = config.get('DEFAULT', 'base_output_path')
    return api_config, env_config


def get_output_paths(_task, _temp, _K, _model, _base_path):
    out_paths = dict()
    common_path = "task_id" + "_" + str(_task['task_id']) + "-" + _model + "-" + "temp_" + str(
        _temp) + "-" + "k_" + str(_K)
    out_paths["saved_path"] = os.path.join(_base_path, common_path + ".json")
    out_paths["dfy_src_path"] = os.path.join(_base_path, common_path + ".dfy")
    out_paths["verification_path"] = os.path.join(_base_path, common_path + "_verification_log.txt")

    return out_paths


def get_context_less_prompt_template(_task):
    script_dir_path = os.path.dirname(os.getcwd())
    prompt_path = os.path.join(script_dir_path, 'prompts/CONTEXTLESS_TEMPLATE.file')
    if not (os.path.exists(prompt_path)):
        print("prompts/CONTEXTLESS_TEMPLATE.file not found!!")
        return
    template = utility.read_file(prompt_path)
    final_prompt = template.format(task_description=_task['task_description'])
    # print(final_prompt)
    return final_prompt


def invoke_gpt4(_task, _temp, _key):
    openai.api_key = _key
    prompt_ = get_context_less_prompt_template(_task)
    messages = [{"role": "user", "content": prompt_}]
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=messages,
        temperature=_temp
    )
    result = response.choices[0].message['content']
    return result


def invoke_palm2(_task, _temp, _key):
    palm.configure(api_key=_key)
    prompt_ = get_context_less_prompt_template(_task)

    completion = palm.generate_text(
        model="models/text-bison-001",
        prompt=prompt_,
        temperature=_temp,
        max_output_tokens=4000,
    )
    return completion.result


def prepare_model_response(_task, _temp, _K, _res, _model, _dafny_code, _isVerified, _verification_bits):
    saved_map = {
        "id": _task['task_id'],
        "K": _K,
        "temperature": _temp,
        "task_id": _task['task_id'],
        "task_description": _task['task_description'],
        "model": _model,
        "response": _res,
        "dafny_code": _dafny_code,
        "isVerified": _isVerified,
        "verification_bits": _verification_bits
    }
    return saved_map


def execute_context_less_prompt(_api_config, _env_config):
    all_response = []
    tasks = utility.load_json(_env_config['data_path'])
    model = _api_config['model']
    for t in tasks:
        task = tasks[t]
        print("Prompting Task: " + task['task_id'])
        for run_count in range(1, int(_env_config["K_run"]) + 1):
            output_paths = get_output_paths(_task=task, _temp=_api_config["temp"], _K=run_count,
                                            _model=model,
                                            _base_path=_env_config["base_output_path"])
            try:
                response = ""
                if model == "gpt-4":
                    response = invoke_gpt4(_task=task, _temp=_api_config['temp'], _key=_api_config['openai_api_key'])
                if model == "palm-2":
                    response = invoke_palm2(_task=task, _temp=_api_config['temp'], _key=_api_config['google_api_key'])

                isVerified, parsedCode = verifier.verify_dfy_src(response, output_paths['dfy_src_path'],
                                                                 output_paths['verification_path'])
                verification_bits = verifier.get_all_verification_bits_count(parsedCode)
                saved_map = prepare_model_response(_task=task, _temp=_api_config['temp'], _K=run_count, _res=response,
                                                   _model=model, _dafny_code=parsedCode, _isVerified=isVerified,
                                                   _verification_bits=verification_bits)
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
                                      "rq1-contextleass-prompting-" + model + ".json"))


if __name__ == '__main__':
    api_config, env_config = get_config()
    execute_context_less_prompt(api_config, env_config)
    print("Done")
