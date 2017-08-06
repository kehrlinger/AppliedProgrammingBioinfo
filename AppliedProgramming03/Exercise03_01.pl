# Extract all accession numbers (the number in between parentheses) from the list of
# proteins in the file “swissprot_list.txt” and print them to a new file named
# “swissprot_accession_numbers.txt”. Make sure to check that the file open
# command worked. If it did not, the program should exit with a warning message.

use strict;
use warnings;

# Define all variables that are not only needed in a certain scope
my $input_file =
'E:\Dokumente\Studium\Master\SS17\UEAppliedProgramming\Exercises\Exercise3\ex3_data\swissprot_list.txt';
my $output_file =
'E:\Dokumente\Studium\Master\SS17\UEAppliedProgramming\Exercises\Exercise3\ex3_data\swissprot_accession_numbers.txt';
my @file_content;      # The original content of the textfile, stored in an array
my @file_content_edit; # The edited content that is written to the new file
my $line_count;        # A line count that is added to the outputfile

# Open the input filehandle
# I decided to store the original input as well as the edited content in arrays
# This allows to print neat console output and was a little bit easier for me to practice
open( my $fh_input, '<', $input_file )
  or die "Cannot read file $input_file, Error: $!.\n";
while ( my $file_content = <$fh_input> ) {
	push( @file_content, $file_content );
}
print
"The following is the original content of the file $input_file:\n@file_content\n\n";

# Three shift commands get rid of the header of the file
for my $i ( 1 .. 3 ) {
	shift(@file_content);
}

# Each line of the input file is edited that only the accession number is left
# The edited line is pushed to the new array along with the line count
foreach my $line_edit (@file_content) {
	$line_count++;
	push( @file_content_edit,
		$line_count . ' - ' . substr( $line_edit, 11, 8 ) . "\n" );
}
close($fh_input);
print
"After the extraction process, the following is written to $output_file:\n\n@file_content_edit";

# Open the output filehandle and write the accession numbers in the output file
open( my $fh_output, '>', $output_file )
  or die "Cannot write to file $output_file, Error: $!.\n";
print $fh_output "@file_content_edit";
close $fh_output;
print "\ndone\nThank you for using this application!\n";
