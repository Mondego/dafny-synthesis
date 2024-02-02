
## [Towards AI-Assisted Synthesis of Verified Dafny Methods](https://arxiv.org/abs/2402.00247)

## Abastract
Large stochastic language models show great promise in many domains, including programming. A promise is easy to make but hard to keep, and language models often fail to keep their promises when applied to programming, generating erroneous code. One promising avenue to keep models honest is to have them generate code in a language that supports formal verification: if and when that is adopted, the model would provide a proof along with the code, and that proof would be automatically verified. Unfortunately, existing large language models show a severe lack of proficiency in verified programming languages. 

In this paper we demonstrate how to improve two pretrained models’ proficiency of the Dafny verified programming language. Using 178 programming problems from the MBPP dataset, we prompt two contemporary models (GPT-4 and PaLM-2 ) to generate methods in Dafny. We use three different types of prompts: a direct contextless prompt, a second one that includes signature of the method and test cases, and a third one that decomposes the problem into steps and includes dynamically-chosen similar examples. Our results show that GPT-4 is better than PaLM-2 , but that, in both models, the third prompt greatly improves the success of the generation task with respect to the direct prompt. With the third prompt, GPT-4 was able generate verified (and human evaluated) Dafny methods in 58% of the cases, while the first prompt generated verified (and human evaluated) methods in only 19% of the cases. Surprisingly, the second prompt had the worst performance, with only 10%. 

One tangible contribution of our work is a collection of 153 MBPP problems that are implemented and formally verified in Dafny, 50 of which were written by us and 103 were automatically synthesized by GPT-4 . Additionally, our results demonstrate that the benefits of formal program verification (proof of correctness) are now within reach of large stochastic language models used to generate code. These results also demonstrate that program verification systems can likewise benefit from incorporating large language models, whether to synthesize code wholesale, to generate specifications, or to construct internal verification annotations such as loop invariants, that are hard for programmers and verification tools to find directly. (e.g. legal arguments, transport signaling, structural engineering, etc.) where solutions must be correct, and where that correctness needs to be verifiable by existing formal tools, or explained to (and understood by) designers and end-users.

## Contents
- 📂 Test Dataset: MBPP-san-DFY
  - A collection of 228 MBPP-san problems based on the [MBPP (Mostly Basic Python
Programming)](https://github.com/google-research/google-research/tree/master/mbpp) dataset curated by Google. Each problem contains description,
method signature, and three test cases translated to suit Dafny.

- 📂  Human Written Dataset: MBPP-DFY-50
  - A collection of 50 problems selected from MBPP-san-DFY-228, containing problem description NLP specifications, Dafny implementation, and test.
  
- 📂 MBPP-DFY-153:
  -  A a collection of 153 MBPP problems that are implemented and formally verified in Dafny, 50 of which were written by the author (i.e, MBPP-DFY-50) and 103 were synthesized by GPT-4 employing Dynamic Few-Shot Prompting.

- 📂 RQs:
  - The following directories contains, prompt, corrosponding LLMs'(GPT-4 and PaLM-2) responses, Dany method synthesis, verification status, bits and author conducted manual tagging results.
    - 📂 RQ1 [Contextless-Prompting]
    - 📂 RQ2-[Signature-Prompting]
    - 📂 RQ3-[Dynamic-Few-Shot-Prompting]

## Directories Structure
```
📦 dafny-synthesis
├──📂 MBPP-DFY-50
│   ├── 📜 mbpp-dfy-50-examples-db.json
│   ├── 📂 src
│   └── 📂 test
├──📂 MBPP-DFY-153
│   ├── 📂 src
│   └── 📂 test
├──📂 MBPP-san-DFY-228
│   └── 📜 mbpp-san-dfy-228-all-task-test.json
├──📂 RQs
│   ├── 📂 RQ1-[Contextless-Prompting]
│   │   ├── 📜 rq1-contextless-prompting-GPT-4-temp_0.75-verified-unverified-tagged.json
│   │   └── 📜 rq1-contextless-prompting-PaLM-2-temp_0.0-verified-unverified-tagged.json
│   ├── 📂 RQ2-[Signature-Prompting]
│   │   ├── 📜 rq2-signature-prompting-GPT-4-temp_0.75-verified-unverified-tagged.json
│   │   └── 📜 rq2-signature-prompting-PaLM-2-temp_0.5-verified-unverified-tagged.json
│   ├── 📂 RQ3-[Dynamic-Few-Shot-Prompting]
│   │   ├── 📜 rq3-dynamic-few-shot-prompting-GPT-4-temp_0.5-verified-unverified-tagged.json
│   │   └── 📜 rq3-dynamic-few-shot-prompting-PaLM-2-temp_0.5-verified-unverified-tagged.json
│   └── 📜 mbpp-dfy-50-examples-db.json
└──
````

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