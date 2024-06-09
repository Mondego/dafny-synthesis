import os
import re
from subprocess import TimeoutExpired, CalledProcessError, check_output
import services.utils as utility


def removed_comments(string):
    # remove all occurrences streamed comments (/*COMMENT */) from string
    code = re.sub(re.compile("/\*.*?\*/", re.DOTALL), "", string)
    # remove all occurrence single-line comments (//COMMENT\n ) from string
    code_2 = re.sub(re.compile("//.*?\n"), "", code)
    return code_2.strip()


def count_method(source):
    occurrence = re.findall("method", source)
    return len(occurrence)


def count_function(source):
    occurrence = re.findall("function", source)
    return len(occurrence)


def count_predicate(source):
    occurrence = re.findall("predicate", source)
    return len(occurrence)


def count_lemma(source):
    occurrence = re.findall("lemma", source)
    return len(occurrence)


def count_while(source):
    occurrence = re.findall("while", source)
    return len(occurrence)


def count_invariant(source):
    occurrence = re.findall("invariant", source)
    return len(occurrence)


def count_assert(source):
    patterns = "assert.*\n"
    occurrence = re.findall(patterns, source)
    return len(occurrence)


def count_ensures(source):
    patterns = "ensures.*\n"
    occurrence = re.findall(patterns, source)
    return len(occurrence)


def count_requires(source):
    patterns = "requires.*\n"
    occurrence = re.findall(patterns, source)
    return len(occurrence)


def get_all_verification_bits_count(code):
    obj = {}
    obj['method'] = count_method(code)
    obj['ensure'] = count_ensures(code)
    obj['requires'] = count_requires(code)
    obj['function'] = count_function(code)
    obj['lemma'] = count_lemma(code)
    obj['predicate'] = count_predicate(code)
    obj['invariant'] = count_invariant(code)
    obj['assert_count'] = count_assert(code)
    return obj


def get_verification_bits_count(path):
    code = utility.read_file(path)
    return get_all_verification_bits_count(code)


def get_verification_bits_count_rq1(save_map):
    response = save_map['response']
    code = parse_code(response)
    return get_all_verification_bits_count(code)


def get_verification_bits_count_rq3(save_map):
    code = save_map['code_response']
    return get_all_verification_bits_count(code)


def get_dafny_verification_result(dfy_file_path):
    cmd_output = ""
    try:
        cmd_output = check_output(["dafny", "verify", dfy_file_path], timeout=300, encoding='utf8')
    except TimeoutExpired as e:
        return -1, -1, cmd_output  # -1, -1 time_out errors
    except CalledProcessError as e:
        cmd_output = e.output  # get the verification errors
        # if detected any parse errors
        # print(cmd_output)
        if "parse errors detected" in cmd_output:
            return -2, -2, cmd_output  # -2,-2 parser_errors
    # print(cmd_output)
    lines = cmd_output.strip().split("\n")
    last_line = lines[len(lines) - 1]
    # Example logs:
    # 'Dafny program verifier finished with 4 verified, 4 errors'
    if "verifier finished with" in last_line:
        errors = last_line.split(",")[1].strip().split(" ")[0]
        verification = last_line.split(",")[0].strip().split(" ")[5]
        return int(verification), int(errors), cmd_output
    else:
        return -3, -3, cmd_output  # -3,-3 type resolution or other errors


def parse_code(model_response):
    pattern = r'```dafny\s*\s*(.*?)\s*```'
    match = re.search(pattern, model_response, re.DOTALL)
    if match:
        return match.group(1).strip()
    else:
        return ""


def verify_dfy_src(response, dfy_source_path, verification_path):
    # parse the response
    code = parse_code(response)
    # save the code in *.dfy file
    if not os.path.exists(dfy_source_path):
        utility.write_to_file(code, dfy_source_path)
    # call verifier:
    verification, errors, cmd_output = get_dafny_verification_result(dfy_source_path)
    utility.write_to_file(cmd_output, verification_path)
    if errors == 0:
        return True, code
    return False, code
    # return true/false
