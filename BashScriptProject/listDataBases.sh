#!/bin/bash
clear 
echo "Here are our DataBases:"
# ls -d */ --> return all directories (DB)   cut -f1 -d/  --> display DB horizontal and cut from (/)
ls -d */ | cut -f1 -d/ 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
