# Exercise08_02
"""Write a function that determines whether two strings are anagrams. Steps:
 a) check if each character in first string occurs in second
 b) convert to lists, sort them and compare"""

seq1 = input('Enter the first word: \n').lower()
seq2 = input('Enter the second word: \n').lower()

seq1 = list(seq1)
seq1.sort()

seq2 = list(seq2)
seq2.sort()

if ''.join(seq1) == ''.join(seq2):
    print ('The strings are anagrams.')
else:
    print ('No anagrams')