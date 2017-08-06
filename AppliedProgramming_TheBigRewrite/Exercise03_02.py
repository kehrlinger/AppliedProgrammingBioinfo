# Rewrite 03_02

reordered_file = []
with open('ex3_data/gene_positions1.txt', 'r') as gene_position1_in:
    for line in gene_position1_in:
        line_list = line.split()
        reordered_line = [line_list[2], line_list[0], line_list[1], line_list[3], line_list[4]]
        reordered_line = '\t'.join(reordered_line) + '\n'
        reordered_file.append(reordered_line)

with open('ex3_data/gene_position1_reordered.txt', 'w') as gene_position1_out:
    gene_position1_out.writelines(reordered_file)