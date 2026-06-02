# Given the amino acid sequence of a polypeptide:
# Phe, Val, Asn, Gln, His, Leu, Cys, Gly, Ser
# 3. Define an array that contains the amino acids in the right order (use the three letters
# notation, as above). Print it in one line (without a foreach loop).
# 4. Determine the number of amino acids in the polypeptide and print it.
# 5. Add the amino acid "His" to the end of the polypeptide (use the "push" function).
# Print the resulting array in one line (without a foreach loop).
# 6. Create a "mutation": replace "Gly" with "Asp". Print the resulting array.
# 7. Ask the user to enter a number between 1 and the number of amino acids in the
# polypeptide, and print the amino acid in that position (e.g. if the user enters "4" the
# program should print "Gln".)
# 8. Create an inversion: get two positions in the sequence from the user and invert the
# sequence of the amino acids between them. For example, if the user enters 3 and
# then 6, the program should replace Asn, Gln, His, Leu with Leu, His, Gln, Asn.
# (Using "array slices" and the "reverse" function). Print the result.
# 9. Create a string that will contain the amino acid sequence of the resulting
# polypeptide, in the format Phe-‐Val-‐Asn... (use string concatenation inside a
# foreach loop. Make sure not to leave a "-‐" before the first amino acid or after the
# last one). Print that string.

use strict;
use warnings;

# The intent of this program is to insert an inversion into a given peptidesequence
# Aminoacidsequence as an array
my @peptide1 = ( "Phe","Val","Asn","Gln","His","Leu","Cys","Gly","Ser");
print "@peptide1 \n";    # Prints the aa-sequence, not the amount of aa
my $peptidelenght = @peptide1;   # Saves the number of aa as a scalar, see "casting"
print "This is your peptide, it is $peptidelenght AA long.\n";
print "Now a mutation is happening in the genome, resulting in some changes.\n";
push( @peptide1, "His" );       # Adds the aa His at the end of the array
@peptide1[7] = ("Asp")
  ;    # Changes the 8th aa to Asp, note that the indices start to count at zero
print "This is the resulting peptide:\n";
print "@peptide1 \n";
print
"Please enter a number between 1 and 10 to get the AA on the corresponding position as output.\n";
my $peptideposition = <STDIN>;
chomp($peptideposition);

# -1 is important to account for the fact that the program starts counting at zero
# Note that a sinle value of an @array was defined by using $array_name[index]
print
  "The AA on position $peptideposition is $peptide1[$peptideposition - 1]. \n";
print
"Now you can introduce an inversion to the sequence.\nEnter two numbers, the inversion will take place between those two positions.\nEnter the beginning of the inversion:\n";
my $begin_of_inversion = <STDIN>;
chomp($begin_of_inversion);
$begin_of_inversion = $begin_of_inversion - 1;
print "Enter the ending position of the inversion:\n";
my $end_of_inversion = <STDIN>;
chomp($end_of_inversion);
$end_of_inversion = $end_of_inversion - 1;
# Following code will allow users to insert the bigger number before the smaller number
my @inversion_points = ($begin_of_inversion, $end_of_inversion);
@inversion_points = sort{$a <=> $b} @inversion_points;

# This will insert the inversed sequence into a new variable, and replace the original universed part with the inversion
# This way both sequences are saved for further use, as seen below
my @inversed_peptide1 = @peptide1;
@inversed_peptide1[ $inversion_points[0] .. $inversion_points[1] ] =
  reverse( @peptide1[ $inversion_points[0] .. $inversion_points[1] ] );

# Now a "--" is introduced after every single element of the array
foreach my $aminoacid (@inversed_peptide1) {
	$aminoacid .= "--";
}
foreach my $aminoacid (@peptide1) {
	$aminoacid .= "--";
}

# The last "--" is deleted by the chop function
# Since the array consists of multiple strings, the exact element has to be defined
# $inversed_peptide1[$#inversed_peptide1] always points to the last element of an array
# Another way would be to count backwards: $array[-1]
chop( $inversed_peptide1[$#inversed_peptide1] );
chop( $inversed_peptide1[$#inversed_peptide1] );
chop( $peptide1[$#peptide1] );
chop( $peptide1[$#peptide1] );
print "Before the inversion, the AA-sequence was: @peptide1\n";
print "After the inversion, the AA-sequnce is: @inversed_peptide1\n";
# I was not able to figure out how to get rid of the empty space after each elemenet in the console.
