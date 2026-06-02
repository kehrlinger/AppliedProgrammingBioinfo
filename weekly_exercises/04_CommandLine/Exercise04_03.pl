#!/usr/bin/perl

use strict;
use warnings; 

#in terminal: perl Exercise04_03.pl sequence.fasta.txt
#in terminal: perl Exercise04_03.pl no_orf.fasta.txt

my $data = $ARGV[0];	#check for command line argument
if(!$data){
   die("Usage: $0 checks for ORF\n");	#print usage
}

#open the file you want (terminal!) and create array
open (my $fh_sequence, '<' , $data) or die "ERROR: $!";	#open file 
my @sequence = <$fh_sequence>;
chomp(@sequence);	#chomp newline
close $fh_sequence;	#close fh
shift(@sequence);	#removes first line (header)

my $complete_sequence;	#initialize variable 

#concatenate all strings of @sequence in the variable $complete_sequence
foreach my $part(@sequence) {
	$complete_sequence = $complete_sequence . $part;
}	

#search for ORF (cannot check triplet order)
if (($complete_sequence =~ /ATG/) & ($complete_sequence =~ /TAG|TAA|TGA/)) {
	print "Used sequence contains ORF\n";	#print if ORF is found
} else {
	print "No ORF found\n";	#print if no ORF is found
}
