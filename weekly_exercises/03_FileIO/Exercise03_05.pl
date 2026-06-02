# Use a hash to count how many times each chromosome name is observed in the
# file “gene_positions1.txt”.

use strict;
use warnings;

my $file_location = "ex3_data/gene_positions1.txt";    # Relative file path
open( my $fh_input, '<',
	$file_location )    # Open the file that should be processed
  or die "Cannot open file $file_location. Error: $!.";

my %occurence
  ;    # Define the hash that is used to count the occurences of a certain string

while ( my $line = <$fh_input> ) {
	chomp($line);
	my @input_line = split( /\t/, $line )
	  ; # Convert the line into an array, with the elements being the different columns
	for my $i ( 1, 2 )
	{ # Delete the first and last two columns, since only the chromosome count is interesting to us
		shift @input_line;
	}
	for my $i ( 1, 2 ) {
		pop @input_line;
	}
	foreach my $string (@input_line)
	{ # Store every element in a hash, or increase its value by one if it already exists
		$occurence{$string}++;
	}
}

# Uncomment to see which keys are in the hash in the first place
# my @keys = sort keys(%occurence);
# my $key_output = join ("\n", @keys);
# print "$key_output\n";

foreach my $location ( sort keys(%occurence) ) {
	if ( $location eq "chromosome" )
	{ # Get rid of the first line "chromosome", this could also be done by converting the whole file into an array and shifting the first element
	# then proceeding with the resulting array
		next;
	}
	else {
		print "At location $location there were $occurence{$location} hits.\n";
	}
}
print "Thank you for using this application!\n";
