
## [Towards AI-Assisted Synthesis of Verified Dafny Methods](https://arxiv.org/abs/2402.00247)

## Abstract
Large language models show great promise in many domains, including programming. A promise is easy to make but hard to keep, and language models often fail to keep their promises, generating erroneous code. A promising avenue to keep models honest is to incorporate formal verification: generating programs’ specifications as well as code so that the code can be proved correct with respect to the specifications. Unfortunately, existing large language models show a severe lack of proficiency in verified programming. 

In this paper, we demonstrate how to improve two pretrained models’ proficiency in the Dafny verification-aware language. Using 178 problems from the MBPP dataset, we prompt two contemporary models (GPT-4 and PaLM-2) to synthesize Dafny methods. We use three different types of prompts: a direct Contextless prompt; a Signature prompt that includes a method signature and test cases, and a Chain of Thought (CoT) prompt that decomposes the problem into steps and includes retrieval augmentation generated example problems and solutions. Our results show that GPT-4 performs better than PaLM-2 on these tasks and that both models perform best with the retrieval augmentation generated CoT prompt. GPT-4 was able to generate verified, human-evaluated, Dafny methods for 58% of the problems, however, GPT-4 managed only 19% of the problems with the Contextless prompt, and even fewer (10%) for the Signature prompt. We are thus able to contribute 153 verified Dafny solutions to MBPP problems, 50 that we wrote manually, and 103 synthesized by GPT-4. 

Our results demonstrate that the benefits of formal program verification are now within reach of code generating large language models. Likewise, program verification systems can benefit from large language models, whether to synthesize code wholesale, to generate specifications, or to act as a "programmer’s verification apprentice", to construct annotations such as loop invariants which are hard for programmers to write or verification tools to find. Finally, we expect that the approach we have pioneered here — generating candidate solutions that are subsequently formally checked for correctness — should transfer to other domains (e.g., legal arguments, transport signaling, structural engineering) where solutions must be correct, where that correctness must be demonstrated, explained and understood by designers and end-users.

## Contents

- 📂 MBPP-san-DFY-228: Test Dataset
  - A collection of 228 MBPP-san problems based on the [MBPP (Mostly Basic Python
Programming)](https://github.com/google-research/google-research/tree/master/mbpp) dataset curated by Google. Each problem contains description,
method signature, and three test cases translated to suit Dafny.

- 📂 MBPP-DFY-50: Human Written Dataset
  - A collection of 50 problems selected from MBPP-san-DFY-228, containing problem description, NLP specifications, Dafny implementation, and tests.
  
- 📂 MBPP-DFY-153:
  -  A a collection of 153 MBPP problems that are implemented and formally verified in Dafny, 50 of which were written by the authors (i.e, MBPP-DFY-50) and 103 were synthesized by GPT-4 employing Dynamic Few-Shot Prompting.

- 📂 RQs:
  - The following directories contain prompt, corrosponding LLMs'(GPT-4 and PaLM-2) responses, Dafny method synthesis, verification status, bits and author conducted manual tagging results.
    - 📂 RQ1 [Contextless-Prompting]
    - 📂 RQ2-[Signature-Prompting]
    - 📂 RQ3-[Dynamic-Few-Shot-Prompting]
- 📂 Scripts:
  - Contains scripts to run different prompts and verification.
    - 📂 data:
      - mbpp-san-dfy-228-all-task-test.json (Test Data)
      - mbpp-dfy-50-examples-db.json (Examples Data for Dynamic Few-Shot)
      - test-task.json (Sample data to test the script)
    - 📂 prompts
      - Prompt templates that we used in our experiment
    - 📂 services:
      - Scripts to build a RAG pipeline and prompt chaining
    - contextless_prompt.py
    - signature_prompt.py
    - dynamic_few_shot_prompt.py
  
## Environment Setup and Execution
To execute the prompt scripts, run verification and test the verified Dafny methods, 
the following requirements need to be installed as prerequisites:

### Dafny Installation
  - Install Dafny (``version (4.0.0.50303)``) on your machine by following [this tutorial](https://github.com/dafny-lang/dafny/wiki/INSTALL).
  - Make sure that ``dafny`` is accessible from the command line.
  - To check Dafny installation , try ``dafny --version`` command in the command line.
  
### Python Package Installation
 -  python ``version >== 3.10`` is required. To check python version try ``python --version``.
   - Clone the repository and install required packages
  ```
  git clone https://github.com/Mondego/dafny-synthesis.git
  cd dafny-synthesis
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  ```
### Update `env.config` file
Make sure to update the `env.config` file before executing the prompt scripts.

``` yml
[DEFAULT]
# OpenAI API KEY
openai_api_key = YOUR_API_KEY
# Google API KEY
google_api_key = YOUR_API_KEY
# LLM to be used gpt-4 or palm-2
model = gpt-4
# model temperature
temp = 0.75
# number of attempts/samples
K_run = 5
# waiting time
cool_down_time = 3
# MBPP-SAN-DFY-228 json path (absolute path)
data_path = /dafny-synthesis/Scripts/data/test-task.json
# base output path (absolute path)
base_output_path = /output/

# Required for dynamic Few-Shot RAG Prompting
[FEWSHOT]
# MBPP-DFY-50 example db json path (absolute path)
example_db_json_path= /dafny-synthesis/Scripts/data/mbpp-dfy-50-examples-db.json
# number of spec examples in [Specification Prompt]
spec_shot_count = 3
# number of code examples in [Chain of Thought (CoT) Prompt]
code_shot_count = 5
```

## Executing Prompts
  - 📜 RQ1-[Contextless-Prompting]
```bash 
  cd dafny-synthesis/code
  python contextless_prompt.py
```
  - 📜 RQ2-[Signature-Prompting]
```bash 
  cd dafny-synthesis/code
  python signature_prompt.py
```
  - 📜 RQ3-[Dynamic-Few-Shot-Prompting]
```bash 
  cd dafny-synthesis/code
  python dynamic_few_shot_prompt.py
```


### Citation
```bibtex
@article{MRHMisuDafnyFSE24,
    title = {Towards AI-Assisted Synthesis of Verified Dafny Methods},
    author = {Md Rakib Hossain Misu, Cristina V. Lopes, Iris Ma, James Noble},
    journal = {Proc. {ACM} Softw. Eng.},
    volume  = {1},
    number  = {{FSE}},
    year = {2024},
    doi = {10.1145/3643763},
    url = {https://doi.org/10.1145/3643763},
    preprint={https://doi.org/10.48550/arXiv.2402.00247}
}
```

## Contact
If you have any questions or find any issues, please contact us at [mdrh@uci.edu](mailto:mdrh@uci.edu)


## License
This repository is licensed under [GNU General Public License v3.0](LICENSE)
