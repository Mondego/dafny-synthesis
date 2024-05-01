import os
import json
import logging


def create_logger(_path_with_name):
    logger = logging.getLogger(_path_with_name)
    logger.setLevel(logging.DEBUG)
    log_file_paths = os.path.join(os.getcwd(), 'logs')
    fh = logging.FileHandler(os.path.join(log_file_paths, _path_with_name + ".log"))
    fh.setLevel(logging.INFO)
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    logger.addHandler(fh)
    return logger


def save_to_json(_map, _path):
    json_string = json.dumps(_map)
    with open(_path, "w") as text_file:
        text_file.write(json_string)


def load_json(_file):
    with open(_file, 'r') as j:
        return json.loads(j.read())


def read_file(_file):
    with open(_file) as reader:
        return reader.read()


def read_lines(_file):
    with open(_file) as reader:
        return reader.read().split("\n")


def write_to_file(_content, _file):
    with open(_file, 'w') as file:
        file.write(_content)


def parse_specification_response(_task, _response):
    signature = _response.split("\n")[1]
    post_condition = "\n".join(_response.split("\n")[3:])
    _task['method_signature'] = signature.strip()
    _task['postconditions'] = post_condition.strip()
    return _task


def get_examples_db_task_id_des_pair(example_json):
    list_of_examples = []
    for t in example_json:
        output_task = {
            "task_id": example_json[t]["task_id"],
            "task_description": example_json[t]["task_description"]
        }
        list_of_examples.append(output_task)
    return list_of_examples


def get_examples_id_task_specification_pair(example_json):
    list_of_examples = []
    for t in example_json:
        output_task = {
            "task_id": example_json[t]["task_id"],
            "task_description": example_json[t]["task_description"],
            "method_signature": example_json[t]["specification"]["method_signature"],
            "postconditions": example_json[t]["specification"]["postconditions"]
        }
        list_of_examples.append(output_task)
    return list_of_examples
