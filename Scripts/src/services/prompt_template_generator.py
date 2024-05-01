from langchain.output_parsers import ResponseSchema, StructuredOutputParser
from langchain.prompts.few_shot import FewShotPromptTemplate
from langchain.prompts.prompt import PromptTemplate


def create_few_shot_code_prompts(examples_task_ids, examples_db, prompt_template):
    examples = get_similar_tasks_based_on_specs(examples_task_ids, examples_db)
    example_prompt_template = PromptTemplate(
        input_variables=["task_description", "method_signature", "preconditions", "postconditions", "code"],
        template_format='jinja2',
        template=prompt_template
    )
    prompt = FewShotPromptTemplate(
        prefix="SYSTEM:\nYou are an expert AI assistant that writes Dafny programs. You are very good at writing verifiable correct code in terms of preconditions and postconditions of methods, and at finding the appropriate loop invariants for the pre/postconditions to hold.",
        examples=examples,
        example_prompt=example_prompt_template,
        suffix='''TASK:\n{{task}}\n\nAI ASSISTANT:\n\n''',
        input_variables=["task"],
        example_separator="\n------------------------------------------------------\n",
        template_format='jinja2'
    )
    return prompt


def get_similar_tasks_based_on_specs(ids, examples_db):
    similar_examples = []
    for id in ids:
        new_obj = {}
        obj = examples_db[id]
        new_obj['code'] = obj['code']
        new_obj['task_description'] = obj['task_description']
        new_obj['method_signature'] = obj['specification']['method_signature']
        new_obj['preconditions'] = obj['specification']['preconditions']
        new_obj['postconditions'] = obj['specification']['postconditions']
        similar_examples.append(new_obj)
    return similar_examples


def create_few_shot_specification_prompts(examples_task_ids, examples_db, prompt_template):
    examples = get_similar_tasks_based_on_task_description(examples_task_ids, examples_db)
    example_prompt_template = PromptTemplate(
        input_variables=["task_description", "method_signature", "postconditions"],
        template_format='jinja2',
        template=prompt_template,

    )

    prompt = FewShotPromptTemplate(
        examples=examples,
        example_prompt=example_prompt_template,
        suffix='''Task:\n{{task}}\n''',
        input_variables=["task"],
        example_separator="\n------------------------------------------------------\n",
        template_format='jinja2'
    )
    return prompt


def get_similar_tasks_based_on_task_description(ids, examples_db):
    # examples_db it's a list
    similar_examples = []
    for id in ids:
        new_obj = {}
        obj = examples_db[id]
        new_obj['task_description'] = obj['task_description']
        new_obj['method_signature'] = obj['specification']['method_signature']
        new_obj['postconditions'] = obj['specification']['postconditions']
        similar_examples.append(new_obj)
    return similar_examples


def get_specification_output_parser():
    response_schemas = [
        ResponseSchema(name="method_signature", description="Method Signature"),
        ResponseSchema(name="postconditions", description="Postconditions")
    ]
    specifications_parser = StructuredOutputParser.from_response_schemas(response_schemas)
    return specifications_parser
