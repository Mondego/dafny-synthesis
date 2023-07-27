This directory contains scripts & stuff for chopping up dafny examples into different "versions"
(should really pick a better word I guess - inputs?  dunno).

you want to be in this directory in an sh-inspired shell

./scripts/import     - copies core Dafny examples from the MBPP directory into 00_imports
./scripts/buildall   - script to build everything, deletes everything, re-import, rebuild
./scripts/generate   - generate directory filter...  builds a new version into a directory


filters are scripts that delete particular things from a file

comment              - remove lines containing //
invariant            - remove lines beginning with invariant
specs                - remove lines beginning with requires, modifies, ensures, increases, reads
firstmethodbody      - remove the first method body IS A HACK