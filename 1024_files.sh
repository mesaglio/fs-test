#!/bin/bash

counter=1

while [ $counter -le 1024 ]
do
	VAR1="Empty_file_$counter"
	touch $VAR1
	sleep 0.5
	((counter++))
done 

