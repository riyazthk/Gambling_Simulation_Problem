#! /bin/bash -x

#declare variables
stake=100
bet=1
totalAmount=0
win=0
totalDays=20
day=1
s=0
count=1

declare -a dayAmount
#calculate a 50% of a stack for min and max
percent=$(( $stake * 50 / 100 ))
min=$(( $stake-$percent ))
max=$(( $stake+$percent ))

#if result is 0 stack is increment with bet
#if result is 1 stack is decrement with bet
function calculateStake(){
    local result=$1

    if [[ $result -eq $win ]]
    then
        stake=$(( $stake+$bet ))
    else
        stake=$(( $stake-$bet ))
    fi
    echo $(( $stake ))
}

#To calculate a stack upto 50%
#using random function to calculate a result
function perDayStake(){
   while [[ $stake -gt 90 && $stake -lt 110 ]]
   do
      result=$(( RANDOM%2 ))
      stake=$(calculateStake $result)
   done
   s=$(( $stake ))
   echo $(( $stake ))
}

#To calculate a perday stack upto 20 days
#Print a total amount
function totalStake(){
   while [[ $day -le 5 ]]
   do
      perStake=$(perDayStake)
      totalAmount=$(( $perStake + $totalAmount ))
      dayAmount[ (day) ]=$(( $perStake ))
      day=$(( $day + 1 ))
   done
   for i in  "${!dayAmount[@]}"
   do
   echo "$i=>${dayAmount[$i]}"
   if [[ ${dayAmount[i]} -eq 90 ]]
   then
   loss=$(( $loss + ($stake-${dayAmount[i]}) ))
   fi
   done
   echo $loss
}
totalStake

