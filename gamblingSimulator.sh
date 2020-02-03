#!/bin/bash -x
echo "Welcome To Gambling Simulator"

#Constant
BET=1

#Variables
stake=100
win=0
loose=0

WIN_MIN=$(($stake*50/100))
WIN_MAX=$(($stake+$WIN_MIN))

while(($stake >= WIN_MIN)) && (($stake <= WIN_MAX))
do
	if [ $((RANDOM%2)) -eq 1 ]
	then
		((win++))
		((stake++))
		echo "Resign The Game value is 150"
	else
		((loose++))
		((stake--))
		echo "Resign The Game value less then 50"
	fi 	
done
