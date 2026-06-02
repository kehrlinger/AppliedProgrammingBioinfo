use FindBin;
use lib "$FindBin::Bin/lib";
use FinalProject;
use strict;
use warnings;

# Start
#print "This script checks a provided meNOG.members.tsv file for genes of one species,
#that do not have a homolog from another species, but do have at least one homolog of a third species.
#Afterwards, the protein ID of those genes are crossreferenced with their functional description
#and printed to the file 'results/results_taxonomic_dist.txt'.
#Press [ENTER] to start.";
#<STDIN>;

# Define variables
my $fp_members = 'data/meNOG.members.tsv';
my $fp_results = 'results/results_taxonomic_dist.txt';
my $fp_desc = 'data/eggnog4.functional_categories.txt';
my $fp_species = 'data/eggnog4.species_list.txt';
my $species1;
my $species2;
my $species3;
my @member_lines_taxon1;
my @member_lines_taxon1_not_2;
my @member_lines_taxon13;
my $gene_count_3;
my @protein_id_list;
my @desc_content;
my $arglength = @ARGV;

# Kind of a failsafe construct.
# If the number of provided arguments is not correct, they are asked for.
# Also allows to run the script independent from runscript.sh
if ($arglength == 6) {
	print "Converting command line arguments...\n";
	$species1 = $ARGV[0] . ' ' . $ARGV[1];
	$species2 = $ARGV[2] . ' ' . $ARGV[3];
	$species3 = $ARGV[4] . ' ' . $ARGV[5];
} else {
	print "Number of arguments provided in command line is $arglength. Should be 6.\nRetrieving information...\n\n";
	print "Please enter the name of the first species:\n";
	$species1 = <STDIN>;
	chomp $species1;
	print "Please enter the name of the second species:\n";
	$species2 = <STDIN>;
	chomp $species2;
	print "Please enter the name of the third species:\n";
	$species3 = <STDIN>;
	chomp $species3;
}

# Get the taxon ID
my $taxon_id_1 = FinalProject::get_taxon_ID($species1, $fp_species);
my $taxon_id_2 = FinalProject::get_taxon_ID($species2, $fp_species);
my $taxon_id_3 = FinalProject::get_taxon_ID($species3, $fp_species);

# Open the members.tsv file
# Check every line for the presence of taxon ID Homo sapiens
# Save only those lines to an array
open (my $fh_members_in, '<', $fp_members) or 
	die "Cannot open file $fp_members: $!.";
while (my $line = <$fh_members_in>) {
	if ($line =~ /$taxon_id_1/) {
		chomp $line;
		push (@member_lines_taxon1, $line);
	}
}
close $fh_members_in;

# Check the Hs lines for Mm genes. Save only those lines that DO NOT include Mm genes in an array.
foreach my $line (@member_lines_taxon1) {
	if ($line !~ /$taxon_id_2/) {
		push (@member_lines_taxon1_not_2, $line);
	}
}

# Check the remaining lines for the presence for the presence of Pt genes
foreach my $line (@member_lines_taxon1_not_2) {
	if ($line =~ /$taxon_id_3/) {
		push (@member_lines_taxon13,
		 $line);
	}
}

# Count the number of occurences of Pt genes in these lines
$gene_count_3 = FinalProject::gene_count_members($taxon_id_3, @member_lines_taxon13);
print "There are $gene_count_3 $species1 genes in the file $fp_members that have no homolog in $species2
but at least one homolog in $species3.\n";

# Isolate the protein ID for the genes found so far.
@protein_id_list = FinalProject::get_protein_ID($taxon_id_3, @member_lines_taxon13);
#print @protein_id_list;

# Check for functional description of the genes in question.
my @func_descr_prot_id = FinalProject::get_desc($fp_desc, @protein_id_list);

# Write the output to a file
print "\nWriting the protein ID and the functional description of the identified genes to file $fp_results...";
open (my $fh_members_out, '>', $fp_results) ||
	die "Cannot open file $fp_results: $!.\n";
print $fh_members_out "@func_descr_prot_id";
close $fh_members_out;
