use FindBin;
use lib "$FindBin::Bin/lib";
use FinalProject;
use strict;
use warnings;

# Define variables
my $fp_members = 'data/meNOG.members.tsv';
my $fp_results = 'results/results_taxonomic_dist.txt';
my $fp_desc = 'data/eggnog4.functional_categories.txt';
my $fp_species = 'data/eggnog4.species_list.txt';
my $species;
my $arglength = @ARGV;
my @members_content;
my @species_lines;
my @protein_id_list;
my @functional_desc;

# Kind of a failsafe construct.
# If the number of provided arguments is not correct, they are asked for.
# Also allows to run the script independent from runscript.sh
if ($arglength == 2) {
	print "Converting command line arguments...\n";
	$species = $ARGV[0] . ' ' . $ARGV[1];
} else {
	print "Number of arguments provided in command line is $arglength. Should be 2.\nRetrieving information...\n\n";
	print "Please enter the name of the first species:\n";
	$species = <STDIN>;
	chomp $species;
}

# Get the taxon_ID of the species of interest
my $taxon_id = FinalProject::get_taxon_ID($species, $fp_species);

# Read members file
open (my $fh_members_in, '<', $fp_members) or
	die "Cannot open file $fp_members: $!.";
while (my $line = <$fh_members_in>) {
	chomp $line;
	push (@members_content, $line);
}

# Isolate the lines that only contain genes from the species specified earlier
foreach my $line (@members_content) {
	my $taxon_id_flag = 0;
	my @tIDpID = split (/,/, (split(/\t/, $line))[-1] );
	foreach my $tID_pID (@tIDpID) {
		if ((split(/\./, $tID_pID))[0] != $taxon_id) {
			$taxon_id_flag++;
		}
	}
	if ($taxon_id_flag == 0) {
		push (@species_lines, $line)
	}
}

# Get the protein ID and the functional description of the groups from those lines
@protein_id_list = FinalProject::get_protein_ID($taxon_id, @species_lines);
@functional_desc = FinalProject::get_desc($fp_desc, @protein_id_list);

# Check for results and print to user
if (@functional_desc) {
	print "The following is a summary of orthologous groups that only contain genes of $species. Also shown are the protein ID of the genes in question and the functional description of the group\n";
	print @functional_desc;
} else {
	print "There are no groups that contain only genes of $species.\n";
}
