#!/bin/bash
cd $DataUse

cat $tableName 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "enter the name of the field you want to update"
read field 
while [[ -z $field ]] || [ "${field//[!0-9]}" != "" ] || [[ $field =~ ['!@#$%^&*():_+'] ]] 
do
    echo "invalid format input"
    echo "enter a string value for the column name"
    read field
done
while [ $field == "ID" ]
do
    echo "you can't update the value of the primary key"
    echo "enter another column name"
    read field
done
if [ ` sed -n 1p $tableName | grep -w $field ` ]
then
    echo $field was found in table $tableName
    clear ;
    cat $tableName;
    cd ..
    source ValidatingIDinUpdate.sh

else 
        echo no field named $field
        select reply in "Enter Correct Field Name" "Back To previous menu" "Exit"
        do
         case $reply in 
         "Enter Correct Field Name")
         cd ..;
         clear;
         source UpdateField.sh;
         ;;
         "Back To previous menu" )
            cd ..;
            clear;
            source UpdateIntoTable.sh;
            ;;
            "Exit")
            echo "GoodBye :)" ; break 100
            ;;
            *) 
            echo "please enter a valid input";;
            esac
        done
fi




