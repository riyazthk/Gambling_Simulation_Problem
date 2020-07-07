#! /bin/bash -x

#declare variables
stake=100
bet=1
totalAmount=0
win=0
totalDays=3
day=1
perStake=0
lossAmount=0
gainAmount=0

declare -a dayAmount

#calculate a 50% of a stack for min and max
function calculatePercent(){

       local stake=$1
       percent=$(( $stake * 50 / 100 ))
       echo $((percent))
}

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
   local min=$1
   local max=$2

   while [[ $stake -gt $min && $stake -lt $max ]]
   do
      result=$(( RANDOM%2 ))
      stake=$(calculateStake $result)
   done
    echo $(( $stake ))
}

#To calculate a perday stack upto 20 days
#Print a total amount
function totalStake(){
   while [[ $day -le $totalDays ]]
   do
      totalAmount=$(( $stake + $perStake ))
      percent=$(calculatePercent $totalAmount)
      min=$(( $stake-$percent ))
      max=$(( $stake+$percent ))
      perStake=$(perDayStake $min $max)
      if [[ $perstake -eq $min ]]
      then
          lossAmount=$(( $lossAmount + $perStake ))
      else
          gainAmount=$(( $gainAmount + $perStake ))
      fi
      dayAmount[ (day) ]=$(( $perStake ))
      day=$(( $day + 1 ))
   done
   for i in  "${!dayAmount[@]}"
   do
   echo "$i=>${dayAmount[$i]}"
   done
}
totalStake
#sort a dayAmount and store in a another array
#and find out maximum won and minimum won
dayAmount2=($(echo ${dayAmount[@]}| tr " " "\n" | sort -n))
length=${#dayAmount2[@]}
for (( i=1;i<=$length;i++ ))
do
if [[ ${dayAmount2[0]} -eq ${dayAmount[i]} || ${dayAmount2[length]} -eq ${dayAmount[i]} ]]
then
echo "$i=>${dayAmount[$i]}"
fi
done

#to check a continue a game for next month or stop a game
if [[ $gainAmount -gt $lossAmount ]]
then
  echo "continue for next month"
  totalstake
else
   echo "stop a game"
fi
