#!/bin/bash
cd $DataUse

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~ $tableName ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "enter the id of the record which you want to update "
read id
    while ! [[ $id =~ ^[0-9]*$ ]] || [[ $id =~ ['!@#$%^&*():_+'] ]] || [[ $id == "" ]] 
	do
	    echo  "Invalid input! id must be a number "
        
	    read id
	done 
  
    if [ `awk '(NR>2)' $tableName  | awk -F : ' {print $1}'| grep $id ` ]
    then
   
        x=`sed -n 1p $tableName | awk '{gsub(":"," ");print}' |awk 'BEGIN{RS=FS}/'$field'/{print NR}' ` 
        echo "enter the new value of $field in row with id:$id"
        read val 
   
        datatype=` awk -F : 'NR==2 {print $'$x'}' $tableName `
        if [[ $datatype == *"Not_NULL"* ]]
        then
            while [  -z $val  ]
			do 
				echo  "This value cannot be empty!"
				read val
			done
            if [[ $datatype == *"int"* ]]
            then
                while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] || [[ $val == "" ]] 
                do
                echo  "Invalid input! enter your value again"
                read val
                done 
                cd .. ;
                source updatingDataofTable.sh
            fi
            if [[ $datatype == *"string"* ]]
            then
                while ! [[ $val =~ ^[a-zA-Z]*$ ]] || [[ $val == "" ]] 
                do
                    echo  "Invalid input! enter your value again"
                    read val
                done 
                cd .. 
                source updatingDataofTable.sh
                    
            fi
            
        else 
        if [[ $datatype == *"int"* ]]
        then
            while ! [[ $val =~ ^[0-9]*$ ]] || [[ $val =~ ['!@#$%^&*():_+'] ]] 
            do
            echo  "Invalid input! enter your value again"
            read val
            done 
            cd .. 
            source updatingDataofTable.sh
        fi
        if [[ $datatype == *"string"* ]]
        then
            while ! [[ $val =~ ^[a-zA-Z]*$ ]] 
            do
                echo  "Invalid input! enter your value again"
                read val
            done 
            cd .. 
            source updatingDataofTable.sh                
        fi  
        fi
    else
        echo "no id $id was found in this table"
        cd .. ;
        source ValidatingIDinUpdate.sh;
    fi