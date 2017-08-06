# Same as 03_01, but only print Human receptors.

use strict;
use warnings;

# Define variables
my $file_location  = "ex3_data/swissprot_list.txt";
my $file_location2 = "ex3_data/swissprot_list_edited.txt";
my @file_content;
my @edited_file;

# Open filehandle to read file
open( my $fh_input, '<', $file_location )
  or die "Cannot open file $file_location. Error: $!.\n";

# Convert the whole file into an array.
# This can also be skipped if the processes that come afterwards are all written in one loop
# I opted for this approach since I wanted to close the filehandle ASAP. This program is relatively small,
# therefore memory is not an issue and it makes the whole script more readable.

while ( my $input_line = <$fh_input> ) {
	push( @file_content, $input_line );
}
close $fh_input;

# Delete the header of the file
for my $i ( 1 .. 3 ) {
	shift(@file_content);
}

# Extract the species information and store the accession number of human receptors in a new array
foreach my $edited_lines (@file_content) {
	$edited_lines = substr( $edited_lines, 5 ); # Deletes the first 5 letters of each line
	my @line_edit = split( /\s+/, $edited_lines ); # Splits the lines at empty spaces
	if ( $line_edit[0] eq "HUMAN" ) { # If the first element is the word HUMAN, save the second element in a new array
		push( @edited_file, $line_edit[1] );
	}
}

# Write the new array with some additional info to the new output file
open( my $fh_output, '>', $file_location2 )
  or die "Cannot write to file $file_location2. Error: $!.\n";
print $fh_output
"The accession numbers of human genes in the $file_location are: @edited_file\nThank you for using this application!\n";

