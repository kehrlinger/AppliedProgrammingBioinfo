#!/usr/bin/perl 

#perl Exercise04_02.pl ex3_data/swissprot_list.txt

my $swissprot_list = $ARGV[0];
if(!$swissprot_list){
   die("Usage: $0 Receptors\n");
# Read the first argument
# Check if argument was provided
# $0 is the name of this file
}

# Open swissprot_list.txt and create array
open (my $fh_sp_list, '<' , $swissprot_list) or die "ERROR: $!";	# Open file (swissprot_list.txt) and print all lines containing HUMAN, RAT or MOUSE 
while (my $receptors = <$fh_sp_list>) {
if ($receptors =~ /HUMAN|RAT|MOUSE/) { #match line against "HUMAN", "RAT" and "MOUSE" 
	print $receptors; # print line if matches (in terminal!!)
}

}
close $fh_sp_list;	#close fh