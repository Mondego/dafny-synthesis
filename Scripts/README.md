## Contents
- 📂 data:
  - mbpp-san-dfy-228-all-task-test.json (Test Data)
  - mbpp-dfy-50-examples-db.json (Examples Data for Dynamic Few-Shot)
  - test-task.json (Dummy data to test the script without executing the whole dataset)

- 📂 prompts
  - Containing prompt templates that we used in our experiment
  
- 📂 src:
  - Containing scripts to execute different prompts


## Requirements and Installation
To execute the prompt scripts, run verification and test the verified Dafny methods, 
the following requirements need to be installed as prerequisites:

### Dafny Installation
  - Follow this wiki https://github.com/dafny-lang/dafny/wiki/INSTALL
      to install the Dafny ``version (4.0.0.50303)`` on any desired UNIX-based system.
  - Make sure that ``dafny`` is accessible from the command line.
  - To check Dafny installation , try ``dafny --version`` command in the command line.
  
### Python Version and Packages Installation
   - Check python version ``python --version``. It should be <b>>=3.10</b>
   - Install required packages
  ```
  pip install openai==0.27.10
  pip install google==3.0.0
  pip install langchain==0.0.354
  ``` 
  OR user may execute the ``requirements.txt`` file in under ``Scripts/requirements.txt``
  ```
  pip install -r requirements.txt
  ```
  
  
## `env.config` 
Make sure to update the `env.config` file before executing the prompt scripts.

``` yml
[DEFAULT]
# OpenAI API KEY
openai_api_key = YOUR_API_KEY
# Google API KEY
google_api_key = YOUR_API_KEY
# LLM to be used 'gpt-4' or palm-2
model = gpt-4
# model temperature
temp = 0.75
# number of attempts/samples
K_run = 5
# waiting time
cool_down_time = 3
# MBPP-SAN-DFY-228 json path (absolute path)
data_path =/data/test-task.json
# base output path (absolute path)
base_output_path =/output/

# Required for to dynamic Few Shot RAG Prompting
[FEWSHOT]
# MBPP-DFY-50 example db json path (absolute path)
example_db_json_path=/data/mbpp-dfy-50-examples-db.json
# number of spec examples in [Specification Prompt]
spec_shot_count = 3
# number of code examples in [Chain of Thought (CoT) Prompt]
code_shot_count = 5

```

## Executing Prompts
  - 📜 RQ1-[Contextless-Prompting]
```bash 
  python contextless_prompt.py
```
  - 📜 RQ2-[Signature-Prompting]
```bash 
  python signature_prompt.py
```
  - 📜 RQ3-[Dynamic-Few-Shot-Prompting]
```bash 
  python dynamic_few_shot_prompt.py
```