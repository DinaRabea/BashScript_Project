#!/bin/bash
cd $DataUse
 echo "~~~~~~~~~~~~~~~~~~~ $tableName table ~~~~~~~~~~~~~~~~~~~~~~~~~~"
choices=("Insert into table" "Update Table" "Delete from Table"  "Back to Previous_Menu" "Exit")
select val in "${choices[@]}"
do
    case $val in 
    "Insert into table")
    clear;
    cd ..;
    source InsertIntoTable.sh
    ;;
    "Update Table")
    clear;
    cd .. ;
    source UpdateIntoTable.sh;
    ;;
    "Delete from Table")
    clear;
    cd .. ;
    source deleteFromTable.sh;
    ;;
    "Back to Previous_Menu")
    clear;
    cd ..;
    source UseDataBaseSelect.sh;
    ;;
    "Exit")
    clear ;
    cd ..;
    echo "GoodBye :)" ; break 100
    ;;
     *) 
    echo "please enter a valid input";;
    esac 
done


