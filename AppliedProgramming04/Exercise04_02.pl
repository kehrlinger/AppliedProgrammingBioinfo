#!/usr/bin/perl

use strict;
use warnings;

#Exercise04_02.pl

#perl Exercise04_02.pl filename.fasta.txt ()

my $file = $ARGV[0];    #check for command line argument
if ( !$file ) {
	die("Usage: $0 predicts fragment lengths after digest\n")
	  ;                 #print usage in console
}

predict_fragment_length($file);

#open the file you want (terminal!) and create array
sub predict_fragment_length {
	my ($data) = @_;
	open( my $fh_sequence, '<', $data ) 
		or die "ERROR: $!";    #open file
	my @sequence = <$fh_sequence>;
	chomp(@sequence);                                          #chomp newline
	close $fh_sequence;                                        #close fh
	shift(@sequence);    #removes first line (>information)
	my $complete_sequence;    #initialize variable
	#concatenate all strings of @sequence in the variable $complete_sequence
	foreach my $part (@sequence) {
		$complete_sequence = $complete_sequence . $part;
	}

	#if ($sequence =~ /[AG]GATC[TC]/) {...}
	#search for GATC
	my @fragments_array;
	if ( $complete_sequence =~ m/[AG]GATC[TC]/ )
	{    #better would be as $ARGV[1] but I'm lazy

		print "Digest:\n"
		  ; #print if RS was found (in terminal when command line argument used)
	
		my @lengths;    #initialize array for the lengths
		@fragments_array = split( /[AG]GATC[TC]/, $complete_sequence )
		  ;             #split before and after these 6 characters -> missing!

		#		foreach my $fragment (@fragments_array) {
		#			my @chars = split( "", $fragment );    #split after every character
		#			my $result =
		#			  scalar(@chars);    #count characters (length of the fragment)
		#			push( @lengths, $result )
		#			  ;    #insert variables into array (all lengths of the fragments)
	my @final_lengths;
	my $first_fragment_length =
	  length( $fragments_array[0] );    #count first fragment
	$first_fragment_length +=
	  1;    #add +1 to first element (missing because of split)
	foreach my $i (@fragments_array) {
		my $base_count = 0;
		$base_count = length($i);
		$base_count += 4; #add +4 to every fragment length ([]GATC[]) is missing
		push( @final_lengths, $base_count );
	}
	shift (@final_lengths);
	unshift( @final_lengths, $first_fragment_length )
	  ;                   #remove the first element, since it is not correctly caltulated in the loop
	  					  #add first fragment again from the earlier calculation

	my $counter;          #initialize counter for every fragment
	foreach my $f (@final_lengths) {
		$counter += (1);    #counts fragments
		print "Fragment " . "$counter - " . "$f" . "bp" . "\n";   #print results
	}
	}
	else {
		print "No restriction sites found\n";    #print if no RS can be found
	}
	return;
}
#
