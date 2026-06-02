# Exercise 08_01
"""Write a function to introduce one random SNP (single nucleotide mutation) into a
sequence. Use the module random: random.randint(1,9) generates a random
number from 1 to 9."""

import random

input_file = input("Please enter the path to the file you want to introduce a SNP to: \n")
seq = []

with open(input_file, 'r') as fh_input:
    for line in fh_input:
        seq.append(line.rstrip()) # Copy the file cont in a list

seq = seq[1:] # The first line is removed (the header)
seq = ''.join(seq) # Converts it into a string

mutation_location = random.randint(3, len(seq)-3) # Generate a random number between 4 and the length of the string minus 3
mutation_base = random.choice(seq)

# Change the mutated base until it no longer matches the base on the SNP position
while seq[mutation_location] == mutation_base:
    mutation_base = random.choice(seq)

# Put together the string of the SNP sequence
seq = seq[0:mutation_location] + mutation_base + seq[mutation_location + 1:]

# Write to the output file
output_file = input("Please enter the name of the file you want to save the new sequence in:\n")
with open(output_file, 'w') as fh_output:
    fh_output.write(seq)