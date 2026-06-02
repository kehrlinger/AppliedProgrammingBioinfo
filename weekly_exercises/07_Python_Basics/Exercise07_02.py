#Second exercise in python
"""Write a function that calculates the number of occurrences of "G" (lower and upper
case) in a sequence of nucleotides (e.g. "GTGCCAAgcgcaCACCCCGCC") passed
to it, and a main program that calls this subroutine.
Hint: In Python, a string is an array of characters."""

string = input("Enter a sequence you want to analyze: ")
base = input("Enter the base you want to count for: ")

def base_count(seq, base):
    seq = seq.lower() #transform to lowercase
    base = base.lower()
    basecount = 0 #initialize basecount
    for i in seq:
        if i == base:
            basecount += 1
    return basecount

count = base_count(string, base)
print ("Your sequence contains %d %s." % (count, base))