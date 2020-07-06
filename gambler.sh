 #! /bin/bash -x

#declare variables
stack=100
bet=1

result=$(( RANDOM%2 ))
if [[ $result -eq 0 ]]
then
  stack=$(( $stack-$bet ))
  echo "win"
  echo $stack
else
  stack=$(( $stack-$bet ))
  echo "lose"
  echo $stack
fi
