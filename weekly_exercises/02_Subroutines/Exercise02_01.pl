# Write a program that finds the minimal enzyme activity for each of the samples
# mentioned. Use a subroutine that returns the lowest number for a given list of
# numbers. Print the name of each tissue and the minimal activity to screen.
# brain: 65, 69, 70, 63, 70, 68
# heart: 102, 95, 98, 110
# lung: 112, 115, 113, 109, 95, 98, 100


use strict;
use warnings;

# Define variables and arrays
my @brain = ( 65,  69,  70,  63, 70, 68 );
my @heart = ( 102, 95,  98,  110 );
my @lung  = ( 112, 115, 113, 109, 95, 98, 100 );

my @min_brain = min_enzyme_act(@brain);
print "Minimal enzyme activity in Brain is: @min_brain";

# Subroutine for minimal enzyme activity
sub min_enzyme_act {
	my @sub_sort = ( sort { $a <=> $b } @_ );# Sort the numbers of the array
	return $sub_sort[0];# The smalles element is the first one, return this element
}
