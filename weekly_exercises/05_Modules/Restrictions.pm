# Create a second Module called Bioinformatics::Restriction. This should contain a
# subroutine that accepts the following arguments:
# 1) a pointer to a list that contains the positions where a restriction enzyme cuts a
# given sequence
# 2) the length of the sequence
# Both are created in the first module
# 3) an optional Boolean value that decides whether the fragment lengths should be
# computed for a linear or circular sequence
# The function should return a sorted (incremental) list of the expected lengths of the
# fragments that would result from cutting with that enzyme.

package Bioinformatics::Restrictions;
use strict;
use warnings;

# Uncomment for testing
# my $seq_length= '100';
# my $is_linear ='circular' ;
# my @cuts = (49, 36, 26, 6);
# print $seq_length . "\n";
# print $is_linear . "\n";
# my @result = fragment_size ($seq_length, \@cuts, $is_linear);
# print "@result . \n";

sub fragment_size{
	my ($seq_length, $cut_pos_ref, $is_linear) = @_;
	my @cutpositions = @{$cut_pos_ref};
	# print "@cutpositions\n";
	my @fragment_sizes;
	foreach my $i (@cutpositions) {
		my $size = ($seq_length - $i);
		push (@fragment_sizes, $size);
		# print "@fragment_sizes\n";
		$seq_length = $i;
		# print "$seq_length\n";
	}
	if ($is_linear eq 'linear') {
		push (@fragment_sizes, $cutpositions[-1]);
	} elsif ($is_linear eq 'circular') {
		$fragment_sizes[0] = ($fragment_sizes[0] + $cutpositions[-1]);
	} else {
		print "Your third argument needs to be either 'linear' or 'circular'."
	}
	@fragment_sizes = sort {$a <=> $b} (@fragment_sizes);
	# print "@fragment_sizes\n";
	return @fragment_sizes;
}
1;