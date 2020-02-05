#!/bin/bash 
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
gamblerDict[$i]=$(($cash-$STAKE))
done
}

function addVal(){
	i=2
   while ((i<=20))
   do
      gamblerDict[$i]=$((${gamblerDict[$i]}+${gamblerDict[$((i-1))]}))
      ((i++))
   done
   echo  ${!gamblerDict[@]}
   echo  ${gamblerDict[@]}
}

function checkLuck() {
addVal
	echo "Luckiest day : "
	for day in ${!gamblerDict[@]}
	do
	  echo $day ${gamblerDict[$day]}
	done | sort -k2 -rn | head -1

	echo "unluckiest day"
	for day in ${!gamblerDict[@]}
	do
      echo $day ${gamblerDict[$day]}
	done | sort -k2 -n | head -1
}
gambler
checkLuck

