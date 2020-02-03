#!/bin/bash -x
echo "Welcome To Gambling Simulator"

#Constant
BET=1

#Variables
stake=100

if [ $((RANDOM%2)) -eq 1 ]
then 
	echo "WIN BET"
else
	echo "Loose BET"
fi
