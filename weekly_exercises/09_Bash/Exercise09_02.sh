#!/usr/bin/bash

number=$1
fact=1

until [ $number -eq 1 ]
do
    fact=$[$fact*$number]
    number=$[$number-1]
done
echo $fact
