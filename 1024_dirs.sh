#!/bin/bash

counter=1

while [ $counter -le 1024 ]
do
	VAR1="Dir$counter"
	mkdir $VAR1
	sleep 0.5
	((counter++))
done 

