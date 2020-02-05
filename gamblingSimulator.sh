##!/bin/bash 
echo "Welcome To Gambling Simulator"

#Constant
BET=1
STAKE=100

#Variables
win=0
loose=0
amount=0
looseCount=0
winCount=0
#calculatin minimum and maximum value of stake 
minimum_value=$((STAKE*50/100))
maximum_value=$((STAKE+minimum_value)) 


function gambler(){
for((i=1;i<=20;i++))
do
   cash=$STAKE
	while(($cash > $minimum_value)) && (($cash < $maximum_value))
	do
		if [ $((RANDOM%2)) -eq 1 ]
		then
			cash=$((cash+BET))
	else
			cash=$((cash-BET))	
	fi	
	done
chekingForMonth
done
}

function chekingForMonth(){
	if(($cash > $STAKE))
	then
		win=$((cash-STAKE))
		amount=$((win+amount))
		echo "day $i win" $win
		((winCount++))
	elif(($cash < $STAKE))
	then
		loose=$((STAKE-cash))
		amount=$((amount-loose))
		echo "day $i loose" $loose
		((looseCount++))
	fi
}
gambler
if(($winCount>$looseCount))
then
	echo "wins amount" $win
else
	echo "loose amount" $loose
fi



