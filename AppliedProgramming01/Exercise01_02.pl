# Write a program that
# a) asks the user for a gene name and the number of nucleotides in its coding
# sequence (the part of its DNA that is translated to protein, from initiation to stop
# codon);
# b) calculates the number of amino acids in the resulting protein and its estimated
# molecular weight (in kilodaltons)
# c) prints the results, including the gene name to the screen


use strict;
use warnings;

print "Please enter the name of your gene of interest:\n";
my $gene_of_interest1 = <STDIN>;

#cut off the /n that is inserted automatically at the end of the <STDIN>
chomp($gene_of_interest1);
print
"Your GOI is $gene_of_interest1, now please enter the lenght of your GOI in bp:\n";
my $lenght_of_goi1 = <STDIN>;
chomp($lenght_of_goi1);

#calc of protein lenght considering 3 bases = 1 aa
my $lenght_of_poi1 = $lenght_of_goi1 / 3;
my $weight_of_poi1 = $lenght_of_poi1 * 110 / 1000;
print
"Your gene of interest is $gene_of_interest1, with a lenght of $lenght_of_goi1 bp.\n";
print
"The protein that is translated from this gene will be $lenght_of_poi1 amino acids long, with the molecular weight of $weight_of_poi1 kDa.\nThank you for using this application!\n";
