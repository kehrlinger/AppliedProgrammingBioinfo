# Create a module called Bioinformatics::Pattern. It should contain a function that
# accepts the following arguments:
# 1) a DNA sequence
# 2) a pattern to match against
# 3) an optional Boolean flag stating whether the sequence is circular or not
# and returns a sorted list of the positions of the matches (decide whether the
# positions should start from 0 or 1, and document this).
# All matches should be found, including overlapping matches. If the sequence is
# circular, this will require a small adaptation of your code.
# A call to the function in your module could for example look like:
# my @pos = Bioinformatics::Pattern::getPatternMatchPositions(
#  ‘sequence’ => $dna_seq,
#  ‘pattern’ => ‘[ag]gatc[ct]',
#  ‘is_circular’ => ‘TRUE’);
# There are many ways to get the locations of a match. The function pos($scalar)
# helps a lot.

package Bioinformatics::Pattern;
use strict;
use warnings;

# Uncomment for testing purpose
# my @input = (
# "gaatcgatcgtagctagctagctagccgacgatcgtacgatcgctagactaaggtggatcgtacgtgctagctacgtagctgctgctgactgaatgagctactcgatgcatcgatgatcgactagctagctacgatcgactagctagctagcatcgatcgatcgatgtaattatatatatcgcgcgcgatcgatggccggcgccccgcattatatattattatatttattgacgcgcgcgcgattaatataagagagagatctctcttatatatatcgcgcgcgctctctagagtgactgctacgcgcgcgatcgatcag",
# 	"[atcg]gg[atcg]", "circular"
# );
# my @matches = get_pattern_match_position(@input);
# print @matches;

# Check whether the third argument is linear or circular
sub get_pattern_match_position {
	my ( $seq, $pattern, $is_circular ) = @_;
	my @result;
	if ( $is_circular eq 'linear' ) {
		@result = get_pattern_match_position_linear( $seq, $pattern );
	}
	elsif ( $is_circular eq 'circular' ) {
		@result = get_pattern_match_position_circular( $seq, $pattern );
	}
	else {
		print "Your third argument has to be either 'linear' or 'circular'.\n";
	}
	return @result;
}

# if linear
sub get_pattern_match_position_linear {
	my ( $seq, $pattern ) = @_;
	my $position;
	my @startpoints;
	my $offset = 0;
	my $seq_length = length($seq);
	while ( $seq =~ m/($pattern)/g ) { # Check if pattern is there
		$offset = $offset + (pos($seq)-(length($1)-1)); # Offset value needs to be introduced to track how many bp were deleted in prior loops; this construct allows to also detect overlapping matches
		my $position = $offset; # To calculate the start of the match, not the end
		push( @startpoints, $position); # Ffor now I will keep this format, when actually in use only the scalars could be better
		$seq = substr( $seq, (pos($seq)-(length($1)-1) )); # Delete the part of the sequence that was ckecked in this loop
	}
	unshift (@startpoints, $seq_length); # Add the sequencelength to the positions to generate the output
	return @startpoints;
}

sub get_pattern_match_position_circular {
	my ( $seq, $pattern ) = @_;
	my $position;
	my @startpoints;
	my $offset = 0;
	my $seq_length = length($seq);
	if ( $seq =~ m/($pattern)/g ) {
		$seq = $seq . substr( $seq, 0, length($1) - 1 ); # Add the patternlength -1 at the end of the sequence to check for an additional match during circularity
	}
	while ( $seq =~ m/($pattern)/g ) { # Check if pattern is there
		$offset = $offset + (pos($seq)-(length($1)-1)); # Offset value needs to be introduced to track how many bp were deleted in prior loops; this construct allows to also detect overlapping matches
		my $position = $offset; # To calculate the start of the match, not the end
		push( @startpoints, $position); # For now I will keep this format, when actually in use only the scalars could be better
		$seq = substr( $seq, (pos($seq)-(length($1)-1) )); # Delete the part of the sequence that was ckecked in this loop
	}
	unshift (@startpoints, $seq_length); # Add the sequencelength to the positions to generate the output
	return @startpoints;
}
1;