# This script takes two species names and counts the number of proteins they share in orthologous groups
# Speciesnames are passed via commandline arguments

use FindBin;
use lib "$FindBin::Bin/lib";
use FinalProject;
use strict;
use warnings;

# Defining all variables needed in the script
my $fp_species = 'data/eggnog4.species_list.txt';
my $fp_members = 'data/meNOG.members.tsv';
my $fp_results = 'results/results_taxonomic_dist.txt';
my $fp_desc = 'data/eggnog4.functional_categories.txt';
my $species1;
my $species2;
my @species_array;
my $taxon_id1;
my $taxon_id2;
my @taxon_id;
my @species_list_content;
my @member_lines_taxon1;
my @member_lines_taxon12;
my %gene_count;
my $arglength = @ARGV;

# Kind of a failsafe construct.
# If the number of provided arguments is not correct, they are asked for.
# Also allows to run the script independent from runscript.sh
if ($arglength == 4) {
	print "Converting command line arguments...\n";
	$species1 = $ARGV[0] . ' ' . $ARGV[1];
	$species2 = $ARGV[2] . ' ' . $ARGV[3];
} else {
	print "Number of arguments provided in command line is $arglength. Should be 4.\nRetrieving information...\n\n";
	print "Please enter the name of the first species:\n";
	$species1 = <STDIN>;
	chomp $species1;
	print "Please enter the name of the second species:\n";
	$species2 = <STDIN>;
	chomp $species2;
}
@species_array = ($species1, $species2);


# Isolate taxon_ID
$taxon_id1 = FinalProject::get_taxon_ID($species1, $fp_species);
$taxon_id2 = FinalProject::get_taxon_ID($species2, $fp_species);
@taxon_id = ($taxon_id1, $taxon_id2);


# Open the members.tsv file
# Check every line for the presence of taxon ID #1
# Save only those lines to an array
open (my $fh_members_in, '<', $fp_members) or 
	die "Cannot open file $fp_members: $!.";
while (my $line = <$fh_members_in>) {
	if ($line =~ /$taxon_id[0]/) {
		chomp $line;
		push (@member_lines_taxon1, $line);
	}
}
close $fh_members_in;

# Check every line with taxon ID #1 for taxon ID #2
# Save to array
foreach my $line (@member_lines_taxon1) {
	if ($line =~ /$taxon_id[1]/) {
		push (@member_lines_taxon12, $line);
	}
}
my $linecount1 = @member_lines_taxon1;
my $linecount2 = @member_lines_taxon12;
print "The number of orthologous groups that contain at least one gene of $species1 is: $linecount1\nThe number of orthologous groups that contain at least one gene of both $species1 and $species2 is: $linecount2\n";

# Count the number of occurences of taxon ID #1 in those lines
my $gene_count_hs = FinalProject::gene_count_members($taxon_id[0], @member_lines_taxon12);

print "\nThe number of genes in $species1 that have at least one homolog in $species2 is:\n$gene_count_hs\n";
1;
