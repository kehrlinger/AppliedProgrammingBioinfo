# Same as 03_02, but use `ls gene_positions*` (`dir /B gene_positions*` on Windows) to
# list all files among those in ex3_data.zip that are called “gene_positions…
# something”, and carry out the reordering of columns for each of them. Store the
# result for each file in a new file called previous_filename.reordered.txt


use strict;
use warnings;

my @system_output;    # Capures the output from the system(dir) command
my @final_files;      # Stores the cropped output from the system(dir) command

# This code allows to clean up older reordered files befor starting the script; uncomment if needed.
# Does not work if the script was run multiple time before uncommenting this section
if (-s 'ex3data\gene_positions1.reordered.txt'){
	print "Cleaning up first...\n";
	system ('del ex3data\gene_positions1.reordered.txt');
}
if (-s 'ex3data/gene_positions2.reordered.txt'){
	print "Cleaning up first...\n\n";
	system ('del ex3data\gene_positions2.reordered.txt');
}

open( my $fh_system, '-|', 'dir ex3data\gene_position*' )
  ;    # Read output from system (dir ex3data\gene_position*); relative path
while ( my $system_output = <$fh_system> )
{      # Read every line from the output, save to array
	push( @system_output, $system_output );
}
print
  "The original system output is formatted as follows:\n\n@system_output\n\n";

# Trim the new array. Since the command output is always formatted the same, this should be universal
for my $i ( 1 .. 5 ) {    # First 5 lines are deleted
	shift(@system_output);
}
for my $i ( 1, 2 ) {      # Last 2 lines are deleted
	pop(@system_output);
}
foreach my $final_file_names (@system_output)
{ # Create the correct path to the files of interest; starts at pos. 39, 19 letters long
	chomp($final_file_names);
	push( @final_files, 'ex3data/' . substr( $final_file_names, 36 ) )
	  ;    # Concatenate the filename to the relative path
}
print
"From this output, the following relative paths are constructed:\n@final_files\n\n";
print "Processing the input into new files...\n\n";
foreach my $file_edit (@final_files)
{ # Every element of @final_files is a relative path to a textfile that is sent to $fh_input
	my @output_file = ();    # Clears the array from the earlier loop
	open( my $fh_input, '<', $file_edit )
	  or die "Cannot read from file $file_edit. Error: $!.\n";
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
	close $fh_input;

	#	print @output_file; # Uncomment to display the output to the console
	for my $i ( 1 .. 4 ) {    # Gets rid of the .txt extension
		chop($file_edit);
	}
	my $output_filename = "$file_edit.reordered.txt"
	  ;                       # Constructs a new file name for the output file
	 #print "The new filename of $file_edit is now $output_filename\n"; # Uncomment if needed
	open( my $fh_output, '>', $output_filename )
	  or die "Cannot write to file $output_filename. Error: $!.\n";
	print $fh_output "@output_file";
	close($fh_output);
}
print "\nDone.\nThank you for using this application\n";
