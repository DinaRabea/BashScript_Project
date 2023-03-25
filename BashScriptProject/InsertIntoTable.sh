#!/bin/bash
cd $DataUse

echo "~~~~~~~~~~~~~~~~~~~~~~$tableName~~~~~~~~~~~~~~~~~~"
num=$(awk -F : 'END{print $1}' $tableName)
		if [[ $num == *'Not_NULL'* ]]
		then
			id=1
			
		else
			((id = $num + 1 )) 
		fi
		row="$id:"
		field=`awk -F : END'{print NF}' $tableName`
		for (( i = 2; i <= $field ; i++ )) 
		do
			fieldName=$(awk -F : ' BEGIN {field = '$i'}{if(NR==1){print $field;}}' $tableName)
			datatype=$(awk -F : ' BEGIN {field = '$i'}{if(NR==2){print $field;}}' $tableName)
			echo "Enter Column$i: ($fieldName):"
			read val

			if [[ $datatype == *"Not_NULL"* ]]
			then
				while [  -z $val  ]
				do 
					echo  "This value cannot be empty!"
					read val
				done
				cd ..
				source ValidtingInsert.sh
			else 
			cd ..
				source NullInsert.sh

	        fi 			
			
			
			if [[ i -eq $field ]]
			then
				row+="$val"
			else
			    row+="$val:"
		    fi
		done
		echo $row>>$tableName
		clear
		echo "The record is inserted to $tableName successfully :)"
		echo "Insert another record?"
		select check in "Yes" "No"
		do
			case $check in
				"Yes" ) 
					clear ; 
					cd ..;
					source InsertIntoTable.sh; 
					clear ;
			    break;;
				"No" ) 
					clear ;
					cd ..;
					source UseTableSelect.sh;
					clear;
					break;;
				* ) 
				echo "Invalid choice";
				;;
			esac
		done