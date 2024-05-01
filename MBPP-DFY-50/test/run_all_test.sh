#!/bin/bash

####### How to run #################
#make it executable
#   >> chmod +x run_all_test.sh
#   >> ./run_all_test.sh
####################################

# 50 Example task ids
exampleTaskIDs=('807' '760' '755' '743' '732' '616' '741' '474' '733' '644' '629' '627' '625' '624' '610' '605' '602' '600' '599' '594' '588' '579' '576' '803' '573' '567' '477' '472' '798' '454' '447' '441' '435' '433' '793' '431' '404' '784' '267' '775' '227' '127' '770' '101' '77' '764' '62' '58' '632' '566')

taskCounter=1
for element in "${exampleTaskIDs[@]}"
do
    file="task_id_$element.dfy"
    if [ -f "$file" ];then
        echo "$taskCounter. Runnig Test For: $(basename "$file")"
        timeout 300s dafny run --no-verify $(basename "$file")
        if [ $? -eq 0 ]; then
            echo "Test Run Done."
        else
            echo "Test Run Passed 5 minutes [Timout]!!!"
        fi
        ((taskCounter++))
        echo ""
    fi
done
