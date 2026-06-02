#!/bin/bash

# Define the hour as a variable
time=$( date +%H )

# Show the complete time
echo
echo It is `date +%T`
echo

# Decide how to greet
if [ $time -lt 9 ]
then 
	echo Good morning, $USER!
elif [ $time -gt 9 ] && [ $time -lt 18 ]
then
	echo Have a nice day, $USER!
elif [ $time -gt 18 ]	
then
	echo Good evening, $USER!
fi
echo
echo
