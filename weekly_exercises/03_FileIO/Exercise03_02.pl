# Write a program that reads the file “gene_positions1.txt” and reorders the columns
# to be “chromosome start end name score”. Print the result to screen.

use strict;
use warnings;

# Absolute file path, fix later
my $input_file =
'ex3data\gene_positions1.txt';

my @output_file;
open( my $fh_input, '<', $input_file )
  or die "Cannot read from file $input_file. Error: $!.\n";

while ( my $file_line = <$fh_input> ) {
	chomp $file_line;
	my @input_line = split( /\t/, $file_line )
	  ;    # Splits the current line at tab and saves the result in an array
	push( @output_file,
		    $input_line[2] . "\t"
		  . $input_line[0] . "\t"
		  . $input_line[1] . "\t"
		  . $input_line[3] . "\t"
		  . $input_line[4]
		  . "\n" );    # Rearranges the different columns in a new array
}
close($fh_input);
print
"The following is the edited content of the file $input_file that will overwrite its original content:\n\n@output_file\n";

open( my $fh_output, '>', $input_file )
  or die "Cannot write to file $input_file. Error: $!.\n";

print $fh_output "@output_file";
close($fh_output);

print "Done\nThank you for using this application!\n";