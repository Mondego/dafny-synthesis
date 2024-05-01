from langchain.chat_models import ChatOpenAI
from langchain.chains import LLMChain
from langchain.memory import ConversationBufferMemory
from langchain_community.llms.google_palm import GooglePalm
import src.services.utils as utility
import src.services.prompt_template_generator as prompt_generator


def initialize_llm(_api_config):
    model = _api_config['model']
    if model == "gpt-4":
        return ChatOpenAI(model_name="gpt-4", temperature=_api_config['temp'],
                          openai_api_key=_api_config['openai_api_key'])
    if model == "palm-2":
        return GooglePalm(model_name="models/text-bison-001", temperature=_api_config['temp'],
                          google_api_key=_api_config['google_api_key'],
                          max_output_tokens=4000)


def run_chain(_api_config, _env_config, new_task,
              _example_db_50_tasks,
              spec_example_selector,
              code_example_selector,
              spec_prompt_template,
              code_prompt_template):
    llm = initialize_llm(_api_config)
    temperature = _api_config['temp']
    key = _api_config['openai_api_key']
    spec_shot_count = int(_env_config["spec_shot_count"])
    code_shot_count = int(_env_config["code_shot_count"])

    similar_tasks = spec_example_selector.select_examples(new_task)
    spec_examples_ids = [t['task_id'] for t in similar_tasks]

    specification_prompt = prompt_generator.create_few_shot_specification_prompts(spec_examples_ids,
                                                                                  _example_db_50_tasks,
                                                                                  spec_prompt_template)

    # print(specification_prompt)
    # Memory
    specification_memory = ConversationBufferMemory(input_key='task', memory_key='chat_history')
    specification_chain = LLMChain(llm=llm, prompt=specification_prompt, verbose=False, output_key='specifications',
                                   memory=specification_memory)

    # Specification Prompt Response
    specification_response = specification_chain.run(new_task['task_description'])

    next_input_task_with_spec = utility.parse_specification_response(new_task, specification_response)

    spec_similar_code_tasks = code_example_selector.select_examples(next_input_task_with_spec)
    code_examples_ids = [t['task_id'] for t in spec_similar_code_tasks]

    code_prompt = prompt_generator.create_few_shot_code_prompts(code_examples_ids, _example_db_50_tasks,
                                                                code_prompt_template)
    # print(code_prompt.get_prompts())

    code_memory = ConversationBufferMemory(input_key='task', memory_key='chat_history')
    code_chain = LLMChain(llm=llm, prompt=code_prompt, verbose=False, output_key='script', memory=code_memory)

    # Dynamic Few-Shot Prompt Response
    code_response = code_chain.run(new_task['task_description'])
    saved_map = {
        "temperature": temperature,
        "spec_example_shots": spec_shot_count,
        "code_example_shots": code_shot_count,
        "spec_examples_ids": spec_examples_ids,
        "specification_response": specification_response,
        "code_examples_ids": code_examples_ids,
        "code_response": code_response
    }
    return saved_map
