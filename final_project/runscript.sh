echo 
echo This script chains together all the Perl scripts in this folder.
echo
echo You will be asked to enter the name of three species of your choice.
echo
echo In the first step, the program will identify genes from species one that have a homolog in species two.
echo
echo In the second step, the program will identify genes from species one that have a homolog in species three, but not in species two.
echo The protein ID of those genes will be isolated and printed to the file 'results/results_taxonomic_dist.txt',
echo along with a functional description of them.
echo If this file already exists, it will be deleted upon execution, so make sure to back it up NOW.
echo
echo The last step is the isolation of orthologous groups that only contain genes from species one.
echo 
echo Every script can be executed by itself, providing the necessary species in form of commandline arguments.
echo Executing the scripts w/o any arguments will trigger a prompt that asks for the necessary input.
read -n 1 -s -r -p "Press any key to continue"
echo
read -p "Please enter the name of the first species (Genus species) " species1
read -p "Please enter the name of the second species (Genus species) " species2
read -p "Please enter the name of the third species (Genus species) " species3
echo

perl orthologe_comparison.pl $species1 $species2

echo
echo Executing the second script...
echo

if [ -e results/results_taxonomic_dist.txt ] 
then
	echo The file results/results_taxonomic_dist.txt already exists. Last chance to back it up.
	read -n 1 -s -r -p "Press any key to continue"
	echo
	echo Removing the file...
	sleep 1
	rm results/results_taxonomic_dist.txt
fi
	
perl taxonomic_distribution.pl $species1 $species2 $species3

echo
echo Executing third script, checking for orthologous groups that only contain genes from $species1.
read -n 1 -s -r -p "Press any key to continue"
echo 
perl rodent_gene_isolation.pl $species1