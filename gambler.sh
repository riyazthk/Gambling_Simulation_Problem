 #! /bin/bash -x

#declare variables
stack=100
bet=1

#To calculate a stack upto 50%
#using random function to calculate a result
#if result is 0 stack is increment with bet
#if result is 1 stack is decrement with bet
while [[ $stack -gt 50 && $stack -lt 150 ]]
do
result=$(( RANDOM%2 ))
if [[ $result -eq 0 ]]
then
  stack=$(( $stack+$bet ))
else
  stack=$(( $stack-$bet ))
fi
done
echo $stack
