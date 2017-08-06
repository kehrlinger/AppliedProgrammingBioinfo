# DeterminThe activity of a certain enzyme was measured in samples from brain, heart and
# lung. In each tissue, the activity was measured several times, giving the following
# results (in arbitrary units): 
# Brain: 65, 69, 70, 63, 70, 68.
# Heart: 102, 95, 98, 110.
# Lung: 112, 115, 113, 109, 95, 98, 100.
# Write a program that calculates and prints the following information for each of the tissues:
# • number of measurements
# • average enzyme activity
# • variance
# • standard deviatione the number of amino acids in the polypeptide and print it

use strict;
use warnings;

# Array definition
my @brain = ( 65,  69,  70,  63, 70, 68 );
my @heart = ( 102, 95,  98,  110 );
my @lung  = ( 112, 115, 113, 109, 95, 98, 100 );

# Measurment count
my $measurement_count_brain = @brain;
my $measurement_count_heart = @heart;
my $measurement_count_lung  = @lung;

# Average calculation
# Define every variable before use as private "my $variable"
my $sum_brain = 0;
my $sum_lung  = 0;
my $sum_heart = 0;

# $sum_xxx is zero, then the value of every element in the array of choice is added to that to get the sum
# Sum is divided by the number of elements in the respective @array
foreach my $brain_value (@brain) {
	$sum_brain = $sum_brain + $brain_value;
}
foreach my $heart_value (@heart) {
	$sum_heart = $sum_heart + $heart_value;
}
foreach my $lung_value (@lung) {
	$sum_lung = $sum_lung + $lung_value;
}
my $brain_avg = $sum_brain / $measurement_count_brain;
my $heart_avg = $sum_heart / $measurement_count_heart;
my $lung_avg  = $sum_lung / $measurement_count_lung;

# Variance calculation
# Sum of squares of every element minus the average of the array is calculated note: ** = square
my $sum_of_squares_brain = 0;
my $sum_of_squares_heart = 0;
my $sum_of_squares_lung  = 0;
foreach my $brain_value (@brain) {
	$sum_of_squares_brain =
	  $sum_of_squares_brain + ( $brain_value - $brain_avg )**2;
}
foreach my $heart_value (@heart) {
	$sum_of_squares_heart =
	  $sum_of_squares_heart + ( $heart_value - $heart_avg )**2;
}
foreach my $lung_value (@lung) {
	$sum_of_squares_lung =
	  $sum_of_squares_lung + ( $lung_value - $lung_avg )**2;
}

# Sum of squares is divided by the number of elements minus 1
my $variance_brain = $sum_of_squares_brain / $measurement_count_brain - 1;
my $variance_heart = $sum_of_squares_heart / $measurement_count_heart - 1;
my $variance_lung  = $sum_of_squares_lung / $measurement_count_lung - 1;

# Standard deviation calculation
# Square root of variance is calculated
my $std_dev_brain = sqrt($variance_brain);
my $std_dev_heart = sqrt($variance_heart);
my $std_dev_lung  = sqrt($variance_lung);

# Brain output
print "----\n";
print "$measurement_count_brain samples from brain tissue were analysed.\n";
print "The average enzyme activity in brain tissue is $brain_avg.\n";
print
"The variance of the different brain measurements is $variance_brain,\nwhile the standard deviation is $std_dev_brain.\n----\n";

# Heart output
print "$measurement_count_heart samples from heart tissue were analysed.\n";
print "The average enzyme activity in heart tissue is $heart_avg.\n";
print
"The variance of the different heart measurements is $variance_heart,\nwhile the standard deviation is $std_dev_heart.\n----\n";

# Lung output
print "$measurement_count_lung samples from lung tissue were analysed.\n";
print "The average enzyme activity in lung tissue is $lung_avg.\n";
print
"The variance of the different lung measurements is $variance_lung,\nwhile the standard deviation is $std_dev_lung.\n----\n";

print "Thank you for using this application.\n"
