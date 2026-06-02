# Write a program that uses the two modules Restrictions and Pattern to read a DNA sequence from a
# file, search for restriction enzyme cutting sites, calculate the fragment sizes, and
# report the result in a nicely formatted way.

use Bioinformatics::Pattern;
use Bioinformatics::Restrictions;
use strict;
use warnings;

print "Please enter the path to the FASTA-file you want to analyze:\n";
my $file_path = <STDIN>;
chomp $file_path;

print "Please enter the sequence you want to match against:\n";
my $pattern = <STDIN>;
chomp $pattern;
$pattern = lc($pattern); # To make it robust against lc/uc

print "Please state whether your sequence is linear or circular:\n";
my $is_linear = <STDIN>;
chomp $is_linear;

open ( my $fh_input, '<', $file_path )
  or die "Cannot read the file: $!.\n";

my @file_content;
while ( my $line = <$fh_input> ) {
	$line = lc($line); # To make it robust against lc/uc
	chomp $line;
	push( @file_content, $line );
}
close $fh_input;
shift @file_content; # Get rid of the header
my $file_cont;
foreach my $i (@file_content) { # Concatenate the elements into one string
	$file_cont = $file_cont . $i;
}
my @cutposition =
  Bioinformatics::Pattern::get_pattern_match_position( $file_cont, $pattern,
	$is_linear ); # Send the arguments into the first module
my $seq_length = shift(@cutposition);
@cutposition = reverse (@cutposition);
my @fragment_sizes = Bioinformatics::Restrictions::fragment_size($seq_length, \@cutposition, $is_linear);
my $loopcount = 1;
foreach my $b (@fragment_sizes) {
	$b = "Fragment number $loopcount is $b bp long.\n";
	$loopcount++;
}
my $fragment_count = @fragment_sizes;
my $first_line = "The total number of fragments when the input sequence is cut at $pattern is $fragment_count.\n";
unshift (@fragment_sizes, $first_line);
print "@fragment_sizes";
