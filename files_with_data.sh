#!/bin/bash

counter=1

while [ $counter -le 100 ]
do
	VAR1="Data_file_$counter"
	dd if=/dev/urandom of=$VAR1 bs=1024 count=10
	echo "Creating 10K file"
	sleep 0.5
	((counter++))
done 

