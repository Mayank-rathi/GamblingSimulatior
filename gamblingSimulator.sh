#!/bin/bash 
echo "Welcome To Gambling Simulator"

declare -A winloose
#Constant
BET=1

#Variables
stake=100
win=0
loose=0
#Calculating win and loose for 20 days
for((i=1;i<=20;i++))
do
stake=100
pre=$stake
minimum=$(($stake*50/100))
maximum=$(($stake+$minimum)) 
while(($stake > $minimum)) && (($stake < $maximum))
do
	if [ $((RANDOM%2)) -eq 1 ]
	then
		((win++))
		((stake++))
	else
		((loose++))
		((stake--))
	fi
done
	if(($stake> pre))
	then
		echo "day $i win by " $((stake-pre))
	else
		echo "day $i loose by " $((pre-stake))
	fi		
done
