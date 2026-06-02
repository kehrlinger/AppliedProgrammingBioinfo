# A given protein consists of 671 amino acids. Assuming an average molecular weight
# of 110 daltons per amino acid, write a program that calculates the estimated
# molecular weight of the protein (in kilodaltons) and writes the result on the screen.

use strict;
use warnings;

#definition of proteinlenght as a variable
my $aa_protein1 = "671";

#definition of avg molec. weight as a variable
my $avg_molecular_weight = "110";

#calc of molecular weight for the protein IN KILODALTON
my $result1 = ( $aa_protein1 * $avg_molecular_weight ) / 1000;

#output
print
"Your estimated proteinweight is $result1 kDa."
