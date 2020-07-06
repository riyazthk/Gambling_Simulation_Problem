#! /bin/bash -x

#declare variables

stack=100
bet=1
totalamount=0

#if result is 0 stack is increment with bet
#if result is 1 stack is decrement with bet

function calculatestack(){
    local result=$1

    if [[ $result -eq 0 ]]
    then
        stack=$(( $stack+$bet ))
    else
        stack=$(( $stack-$bet ))
    fi
    echo $(( $stack ))
}

#To calculate a stack upto 50%
#using random function to calculate a result

function perdaystack(){
   while [[ $stack -gt 50 && $stack -lt 150 ]]
   do
      result=$(( RANDOM%2 ))
      stack=$(calculatestack $result)
   done
   echo $(( $stack ))
}

#To calculate a perday stack upto 20 days
#Print a total amount

while [[ $day -le 20 ]]
do
perdaystack=$(perdaystack)
totalamount=$(( $perdaystack + $totalamount ))
day=$(( $day + 1 ))
done
echo $totalamount
