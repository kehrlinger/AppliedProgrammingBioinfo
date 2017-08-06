#!/bin/bash

read -p "Please enter the path to the file you would like to analyze: " path

echo
echo This is a summary of how many times the different species are present in the file $path:
echo
echo `tail -n+4 $path | tr '_' ' ' | cut -d' ' -f 2 | sort | uniq -c | sort`
echo
echo This result is also saved to the file 'output.txt'
echo
# Explanation:
# tr --> changes the underscore to a whitespace
# cut -df --> delimiters the line at whitespaces and isolates the second element 
# sort --> sorts the elements alphabetically
# uniq -c --> counts the different elements
# sort --> sorts them by occurance
tail -n+4 ex3data/swissprot_list.txt | tr '_' ' ' | cut -d' ' -f 2 | sort | uniq -c | sort > output.txt