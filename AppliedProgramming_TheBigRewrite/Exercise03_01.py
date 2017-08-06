# Rewrite03_01

file_cont_in = []  # Create lists for the file content, this probably could be done better
file_cont_out = []

with open('ex3_data/swissprot_list.txt', 'r') as inputfile:  # Read the filecontent in a list
    for line in inputfile:
        file_cont_in.append(line)

for i in range(1, 4):  # Remove the first three lines; Why from 1-4 though?
    file_cont_in.pop(0)

for line in file_cont_in:
    col_list = line.split()  # Split the lines, this gets rid of all whitespaces
    file_cont_out.append(col_list[1] + '\n')  # Accession number is second element,store in list

with open("testfile.txt", 'w') as outputfile:
    outputfile.writelines(file_cont_out)  # Write list to file; append newline at end