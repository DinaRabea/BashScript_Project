#!/bin/bash
echo "Enter the Name of the DataBase you want to delete :("
read DataBaseDelete
if [ ` find  -name "$DataBaseDelete" ` ]
then 
    clear
    echo "Are you Sure you want to delete "
    select answer in "Yes" "No" "Exit"
    do 
        case $answer in
        "Yes") 
        clear
        rm -r $DataBaseDelete ;
        echo $DataBaseDelete is removed successfully;
         select reply in "Go back to Main_Menu" "Exit"
         do
             case $reply in 
             "Go back to Main_Menu") 
             clear;
             source MainmenuSelect.sh;
             break   
             ;;
            "Exit")
            echo "GoodBye :)" ; break 100
            ;;
            *) 
            echo "please enter a valid input";;
            esac
        done
        ;;
        "No")
        clear;
        source MainmenuSelect.sh;
        break
        ;;
        "Exit")
            echo "GoodBye :)" ; break 100
            ;;
        *) 
            echo "please enter a valid input";;
        esac 
    done
   
else 
 # DB name not found
    echo "No DataBase named $DataBaseDelete"    
    select ans in "Return Back To Main_Menu" "Exit"
    do
        case $ans in
        "Return Back To Main_Menu")
        clear ;
        source MainmenuSelect.sh;
        break   
        ;;
        "Exit")
        echo "GoodBye :)" ; break 100
        ;;
        *) 
        echo "please enter a valid input";;
        esac
    done
fi


