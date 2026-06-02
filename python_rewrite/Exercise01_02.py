# Rewrite01_02

gene_name = str(input("Please enter the name of the gene you would like to use in this program: "))
nucleotide_count = float(input("Please enter the number of nucleotides this gene consists of: "))


def amino_acid_count(nucleotides):
    amino_acids = nucleotides / 3
    return amino_acids


amino_acids = amino_acid_count(nucleotide_count)
print("Your input gene " + gene_name + " has " + str(amino_acids) + " amino acids after transcription.")
