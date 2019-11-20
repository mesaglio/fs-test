#!/bin/bash

counter=1
rmcounter=1
files_counter=1
while [ $counter -le 1024 ]
do
	VAR1="Dir$counter"
	mkdir $VAR1
	echo "Create ($VAR1)"
	sleep 0.5
	((counter++))
done 

while [ $rmcounter -le 1024 ]
do
	VAR2="Dir$rmcounter"
	rm -r $VAR2
	echo "Delete ($VAR2)"
	sleep 0.5
	((rmcounter++))
done 

while [ $files_counter -le 500 ]
do
	VAR3="Dir$files_counter"
	mkdir $VAR3
	cd $VAR3
	VARF="File_$files_counter"
	dd if=/dev/urandom of=$VARF bs=1024 count=10
	echo "Create $VARF on $VAR3"
	cd ..
	sleep 0.5
	((files_counter++))
done 
