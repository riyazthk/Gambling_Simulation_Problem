#! /bin/bash -x

#declare variables
stack=100
bet=1
totalamount=0
win=0
totaldays=20

#calculate a 50% of a stack for min and max
percent=$(( $stack *50 / 100))
min=$(( $percent-$stack ))
max=$(( $percent+$stack ))

#if result is 0 stack is increment with bet
#if result is 1 stack is decrement with bet
function CalculateStack(){
    local result=$1

    if [[ $result -eq $win ]]
    then
        stack=$(( $stack+$bet ))
    else
        stack=$(( $stack-$bet ))
    fi
    echo $(( $stack ))
}

#To calculate a stack upto 50%
#using random function to calculate a result
function PerDayStack(){
   while [[ $stack -gt $min && $stack -lt $max ]]
   do
      result=$(( RANDOM%2 ))
      stack=$(CalculateStack $result)
   done
   echo $(( $stack ))
}

#To calculate a perday stack upto 20 days
#Print a total amount
while [[ $day -le $totaldays ]]
do
perdaystack=$(PerDayStack)
totalamount=$(( $perdaystack + $totalamount ))
day=$(( $day + 1 ))
done
echo $totalamount
