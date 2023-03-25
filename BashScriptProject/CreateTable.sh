#!/bin/bash
echo "enter the name of the table you want to create :)"
read tableCreate
export $tableCreate
cd $DataUse


if [ `find . -name $tableCreate `  ]
then 
    clear
    echo "table already exists"
    select rep in "Go back to Previous page" "Exit"
    do  
        case $rep in
        "Go back to Previous page")
        clear;
        cd .. ;
        source UseDataBaseSelect.sh
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
   
else 
    if [[ -z $tableCreate ]] || [ "${tableCreate//[!0-9]}" != "" ] || [[ $tableCreate =~ ['!@#$%^&*():_+'] ]] 
    then 
    clear ;
    echo "~~~~~~~~~~~~~~~~~~~ FileName is not a Valid Value ~~~~~~~~~~~~~~~~~~~~~~~~~~";
    cd ..;
    source CreateTable.sh
    else
    touch $tableCreate
    # field1 = iD:
    columns="ID:"
	datatype="int(Not_NULL):"
		echo "~~~~~~TableID is created automatically in the first field as (PK)~~~~~~~~~~"
        echo "~~~~~~~~Table columns can't exceed 10 columns~~~~~~~~~~"
		# fields inserted by user started from field2 
        FieldNumber=2
		function insert {
			echo "Enter field number $FieldNumber:"
			read field
            while [[ -z $field ]]
            do
                echo "field name can't be empty &please enter a valid value"
                read field
            done
            export $field
        
            
            if [ `echo $columns | grep $field` ]
            then 
                echo "field Named $field already exists";
                insert
            else
            # iD:age:
			columns+="$field"
        
			echo "Choose the datatype:"
			select data in "Integer" "String"
			do
				case $data in
                # ID:agr:
                # int(Not_Null):int(Not_Null)
					"Integer" ) datatype+="int"; break;;
					"String" ) datatype+="string";   break;;
					* ) echo "Invalid choice";
				esac
			done
			echo "Choose it can be NULL or not:"
			select prop in "NULL" "Not_NULL"
			do
				case $prop in
					"NULL" ) datatype+="";  break;;
					"Not_NULL" ) datatype+=" (Not_NULL)";  break;;
					* ) echo "Invalid choice";
				esac
			done
          
        if [  $FieldNumber -lt 10 ]
        then
			echo "Insert another field?"
			select check in "Yes" "No"
			do
				case $check in
					"Yes" )
                    if [ $FieldNumber -lt 10 ]
                    then
                    ((FieldNumber=FieldNumber+1)) ;
					columns+=":";datatype+=":"; 
					insert ; 
                    fi
					break ;;
                    
					"No" ) break;;
					* ) echo "Invalid choice";
				esac
			done
            fi
        fi
		}
        
		insert
		echo $columns>>$tableCreate
		echo $datatype>>$tableCreate
	
    

	echo "table $tableCreate created successfully :)"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    cd ..
    source UseDataBaseSelect.sh
    fi
fi
