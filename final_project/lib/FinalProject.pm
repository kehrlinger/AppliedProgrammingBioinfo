package FinalProject;
use strict;
use warnings;

# Isolates the taxon ID from species_list.txt based on the name of a species
sub get_taxon_ID {
	# Define variables
	my ($species, $fp_species) = @_;
	$fp_species = $fp_species;
	my @species_list_content;
	my $taxon_id;
	
	# Open the file or quit with error
	open (my $fh_species_in, '<', $fp_species) or
		die "Cannot open $fp_species: $!.";

	# Save file content to an array, i tried to avoid that, but it apparently reads the fh only once
	# and i could not loop over both species, therefore I opted for this method.
	# Close FH
	while (my $line = <$fh_species_in>) {
		chomp $line;
		push(@species_list_content, $line);
	}
	close $fh_species_in;

	# Check for the presence of the species of interest
	# A flag is raised if the species is encountered.
	# If the flag is raised, the program print an ok-message and continues.
	# If the flag is not raised, the program throws an error and stops.
		my $species_presence = 0;
		 foreach my $line (@species_list_content) {
			if ($line =~ /$species/) {
				$species_presence += 1;
			}
		 }
			if ($species_presence >= 1) {
				print "$species is present in the provided species_list file, continuing...\n"
			} else {
				die "$species cannot be found in the provided species_list $fp_species\n\tCheck if you provided the correct file.\n\tCheck if the spelling fits the nomenclatur 'Genus species'.\n\tContact the developer."
			}

	# Isolate the taxon ID, save to array
		foreach my $line (@species_list_content){		
			if ($line =~ /$species/){
				my @taxon_determination = split(/\t/, $line);
				$taxon_id = $taxon_determination[1];
			}
		}

	print "The taxon ID for $species is: $taxon_id.\n\n";
return $taxon_id
}

# Counts the number of occurences of a certain taxon ID in an array with lines from the members.tsv file
sub gene_count_members {
	my @input = @_;
	my $taxon_id = shift(@input);
	my @member_lines = @input;
	my %gene_count;
	
	foreach my $line (@member_lines) {
		my @member_line_tmp = split (/\t/, $line);
		my @taxonIDproteinID_line = split(/,/, $member_line_tmp[-1]);
		foreach my $tIDpID (@taxonIDproteinID_line) {
			my @taxonIDproteinID = split (/\./, $tIDpID);
			$gene_count{$taxonIDproteinID[0]}++;
		}
	}
return $gene_count{$taxon_id};
}

# Isolates the protein ID of every gene from a certain taxon ID from the members.tsv file
sub get_protein_ID {
	
	# Define the necessary variables
	my @member_lines = @_;
	my $taxon_id = shift(@member_lines);
	my @protein_ids;
	
	# Isolate the protein IDs and save them in an array.
	foreach my $line (@member_lines) {
		my $protein_ids_per_line;
		my @member_line_tmp = split (/\t/, $line);
		my @taxonIDproteinID_line = split(/,/, $member_line_tmp[5]);
		foreach my $tIDpID (@taxonIDproteinID_line) {
			my @taxonIDproteinID = split (/\./, $tIDpID);
			$protein_ids_per_line .=  $taxonIDproteinID[1] . "\t"; # Form a string of proteiIDs delimited by tab
		}
		push (@protein_ids, $member_line_tmp[4] . ">" . $protein_ids_per_line .  "\n"); # Include the functional description of the group in front of the string
		
	}
return @protein_ids; # "functional_category \t protein_id1_line1 \t protein_id2_line1 \t...", "functional_category \t protein_id1_line2 \t protein_id2_line2 \t..."
}

# Isolate the description of the finctional group based on the provided protein ID from get_protein_ID
sub get_desc {
	my @input = @_;
	my $fp_desc = shift(@input);
	my @protein_id_list = @input;
	my @desc_content;
	
	open (my $fh_desc_in, '<', $fp_desc) or
		die "Cannot open file $fp_desc: $!";
		
	while (my $line = <$fh_desc_in>) {
		chomp $line;
		push (@desc_content, $line);
	}
	close $fh_desc_in;

	foreach my $line (@protein_id_list) {
		chomp $line;
		my $func_desc = (split (/>/, $line))[0];
		my $desc = $func_desc . "\t";
		foreach my $letter (split (//, $func_desc)) {
			foreach my $desc_line (@desc_content) {
				if ($desc_line =~ /\[$letter\]/) {
					my @desc_line_split = split(/\]/, $desc_line);
					$desc .= $desc_line_split[1] . "\t";
				}
			}
		}
		$line = $desc . (split (/>/, $line))[1] . "\n";
	}
return @protein_id_list;	
}
1;
