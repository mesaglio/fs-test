#!/bin/bash

counter=1
_counter=1
clear
echo "Open and Write"
while [ $counter -le 10 ]
do
	VAR1="Data_file_$counter"
	dd if=/dev/urandom of=$VAR1 bs=1024 count=10 status=none
	echo "Creating $VAR1 with 10Kb"
	((counter++))
done
sleep 3 
clear
ls -lS --color=auto

truncate=6

echo "Truncate 5 files to 0"
while [ $truncate -le 10 ]
do
	VAR1="Data_file_$truncate"
	truncate -s 0 $VAR1
	((truncate++))
done 

ls -lS --color=auto

sleep 4
clear

echo "Create 2 directories"
while [ $_counter -le 2 ]
do
	VAR1="DIR_$_counter"
	mkdir $VAR1
	sleep 0.5
	((_counter++))
done 

ls -lS --color=auto
sleep 3
clear
echo "Move Files into DIR2"
files=5
while [ $files -le 10 ]
do
	VAR1="Data_file_$files"
    	VAR2="DIR_2/"
	mv $VAR1 $VAR2
	((files++))
done 

sleep 3
clear
tree

sleep 3
clear

echo "Move DIR_2 into DIR_1"
mv DIR_2 DIR_1
sleep 3

tree

sleep 3
clear
cd DIR_1/DIR_2
echo "Read 2 last lines from Data_file_5"
tail --lines=2 Data_file_5
sleep 4
clear
echo "Write on Data_file_10"
sleep 2
echo "No pude ejemplificarlo mejor." >> Data_file_10
echo "Read from Data_file_10"
sleep 2
cat Data_file_10
sleep 3

clear
echo "Copy Data_file_10 to mejor_ejemplo.txt"
cd ../../
cp DIR_1/DIR_2/Data_file_10 mejor_ejemplo.txt
ls -lS --color=auto
sleep 2
