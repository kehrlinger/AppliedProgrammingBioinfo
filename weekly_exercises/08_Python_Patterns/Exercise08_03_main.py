# Exercise08_03_main.
# This program controls two modules in the same folder (no need to change the PYTHONPATH).
# The two modules are called Pattern_search.py and Restriction_sizes.py.
import AppliedProgramming08.Restriction_sizes
import AppliedProgramming08.Pattern_search

pattern = '[ct]ttgt[agtc]'
circular = 'no'
file_path = 'sequence.fasta'

#file_path = input("Please place the file you want to analyze in the folder of this program and enter the name of the file: \n")lower()
#pattern = input("Please enter the restriction sequence you want to check for:").lower()
#circular = input("Is the sequence circular? (yes|no)").lower()

with open(file_path, 'r') as fh_input:
    file_cont = []
    for line in fh_input:
        file_cont.append(line.rstrip().lower())

file_cont = file_cont[1:]
seq = ''.join(file_cont)
print (seq)
match_positions = AppliedProgramming08.Pattern_search.match_pos(seq, pattern, circular)
print ("\nThe restriction pattern of interest (%s) cuts at the following positions: %s" % (pattern, match_positions))
frag_sizes = AppliedProgramming08.Restriction_sizes.restriction(seq, pattern, circular, match_positions)

counter = int()
for size in frag_sizes:
    counter += 1
    print ("Fragment number %d is %d bp long." % (counter, frag_sizes[counter-1]))

print ("Additionally, this is a sorted list of the fragment sizes, sorted in ascending order:", sorted(frag_sizes))


