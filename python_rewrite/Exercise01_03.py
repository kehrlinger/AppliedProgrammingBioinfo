# Rewrite01_03

prot_seq = ['Phe', 'Val', 'Asn', 'Gln', 'His', 'Leu', 'Cys', 'Gly', 'Ser']  # Original list
print("Original protein sequence is: " + str(prot_seq))  # Has to be changed into a string to be printed
print("The original sequence contains " + str(len(prot_seq)) + " amino acids.")  # Number changed to string
prot_seq.append('His')  # Unlike strings, lists can be manipulated without reassigning them to themselves
print("With another AA at the end, the lists looks like this: \n" + str(prot_seq))
prot_seq.pop(-3)
prot_seq.insert(-2, 'Asp')  # Easier way to change the AA at this position?
print("After a mutation, the new list looks like this:\n" + str(prot_seq))
prot_index = int(input("Please enter the position of the sequence of which you would like to know the AA from: "))
print(prot_seq[prot_index - 1])
inv_start = int(input("Please enter the start position of your inversion of choice: ")) - 1
inv_end = int(input("Please enter the end position of your inversion: ")) + 1
prot_seq_inv = prot_seq[inv_start:inv_end]
prot_seq_inv.reverse()
prot_seq[inv_start:inv_end] = prot_seq_inv
print(prot_seq)
print('--'.join(prot_seq))