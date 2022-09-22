#!/bin/bash

# SOURINTHONE CHRISTOPHE 50221606 - Assignement 3
# ./multi-table.sh [Integer > 0 ] [Integer > 0]
# Compute and print the multiplication between each parameter

FIRST_PARAM=$1
SECOND_PARAM=$2
ITERATION=1
ITERATION_2=1
RESULT=0
re='^[0-9]+$'

error_checking()
{
 #Check existing parameters
 if [ -z "$FIRST_PARAM" ]; then
	echo "Invalid input, you need to provide 2 parameters."
 	echo "Usage: ./multi-table.sh [Integer > 0] [Integer > 0]">&2; exit 1
 elif [ -z "$SECOND_PARAM" ]; then
	echo "You need to provide 2 parameters."
        echo "Usage: ./multi-table.sh [Integer > 0] [Integer > 0]">&2; exit 1
 fi
 #Check parameters value is between 0 to 9
 if ! [[ $FIRST_PARAM =~ $re ]] ; then
  	echo "Invalid input, Parameter 1 is not a valid number" >&2; exit 1
 fi
 if ! [[ $SECOND_PARAM =~ $re ]] ; then
        echo "Invalid input, Parameter 2 is not a valid number" >&2; exit 1
 fi

 return 0
}

compute()
{
 error_checking

while (($ITERATION_2 < $FIRST_PARAM + 1)) 
do
	while (($ITERATION < $SECOND_PARAM + 1))
 	do
		RESULT=$((ITERATION * ITERATION_2))
		printf "$ITERATION*$ITERATION_2=$RESULT\t"
		ITERATION=$(($ITERATION+1))
 	done
	echo ""
	ITERATION=1
	ITERATION_2=$(($ITERATION_2+1))
done
}

compute
