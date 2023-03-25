#!/bin/bash
cd $DataUse

echo "Enter The Name of the Table you Want to delete "
read TableDelete
# search table in current directory
if [ ` find . -name $TableDelete ` ]
then 
    echo "Are you Sure you want to delete "
    select answer in "Yes" "No" "Exit"
    do 
        case $answer in
        "Yes") 
        clear
        rm  $TableDelete ;
        echo $TableDelete is removed successfully;
         select reply in "Go back to Previous" "Exit"
         do
             case $reply in 
             "Go back to Previous") 
             clear;
             cd ..
             source UseDataBaseSelect.sh;
             break   
             ;;
            "Exit")
            cd ..
            echo "GoodBye :)" ; break 100
            ;;
            *) 
            echo "please enter a valid input";;
            esac
        done
        ;;
        "No")
        cd ..
        clear;
        source UseDataBaseSelect.sh
        ;;
        "Exit")
        cd .. ;
        echo "GoodBye :)" ; break 100
        esac
    done
else 
    clear;
    # there is no table with this name in current directory(DB)
    echo "No table named $TableDelete"
    echo "Do you Want to go back or exit?"
    select repl in "Go Back" "Exit"
    do
        case $repl in 
        "Go Back")
        # cd .. to exit from current DB else i cant found useDatabase file in current directory
        cd ..
        clear 
        source  UseDataBaseSelect.sh
        ;;
        "Exit")
        cd .. 
        echo "GoodBye :)" ; break 100
        ;;
          *) 
        echo "please enter a valid input";;
        esac    
    done
fi
