# Write a function that calculates the number of occurrences of "G" (lower and upper
# case) in a sequence of nucleotides (e.g. "GTGCCAAgcgcaCACCCCGCC") passed
# to it, and a main program that calls this subroutine.
# Use: while, chop, if. Hint: your routine can chop one character after the other from
# $seq, and check whether it equals to "G" (or "g"), until $seq is empty.

use strict;
use warnings;

print "Please enter a sequence of your choice:\n";
my $seq=<STDIN>;
chomp ($seq);
# Converts everything to lowercase
$seq = lc($seq);
print "Now,please enter which base you want to count in this sequence:\n";
my $base=<STDIN>;
chomp ($base);
$base = lc($base);
my $base_count = base_count($seq, $base); # Input to the subfunction are the sequence and the base that should be counted
base_count_output($base_count);
print "Thank you for using this application.\n";

# Subfunction output decision
# Gives output corresponding to the result
sub base_count_output {
	$base_count = $_[0];
	if ($base_count >= 2){
	print "Your sequence has $base_count '$base' in it.\n";
} elsif ($base_count == 1) {
	print "There is $base_count '$base' in your sequence.\n";
} else {
	print "There are $base_count '$base' in your sequence.\n";
}
}
# Subfunction base-count
# Creates an array for every base that should be counted in the sequence, return the scalar value of this array
sub base_count{
	my ($seq1, $base1) = @_;
	my @base_count;
while ($seq1 ne '') {
	$b = chop ($seq1);
	if ($b eq $base1) {
		push (@base_count, $base1);
	}
}
	$base_count = @base_count;
	return $base_count;
}

