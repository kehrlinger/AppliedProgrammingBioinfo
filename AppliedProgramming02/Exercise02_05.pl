# Rewrite 01_04 to use functions

use strict;
use warnings;

# Array definition
my @brain = ( 65,  69,  70,  63, 70, 68 );
my @heart = ( 102, 95,  98,  110 );
my @lung  = ( 112, 115, 113, 109, 95, 98, 100 );

# Element count
my $brain_count = @brain;
my $heart_count = @heart;
my $lung_count = @lung;
print "Count: $brain_count, $heart_count, $lung_count\n";

# Mean calculation
my $brain_mean = mean_value(@brain);
my $heart_mean = mean_value(@heart);
my $lung_mean = mean_value(@lung);
print "Mean: $brain_mean, $heart_mean, $lung_mean\n";

# Variance calculation
my $brain_var = variance(@brain);
my $heart_var = variance(@heart);
my $lung_var = variance(@lung);
print "Variance: $brain_var, $heart_var, $lung_var,\n";

# Standard deviation calculation
my $brain_std_dev = std_dev($brain_var);
my $heart_std_dev = std_dev($heart_var);
my $lung_std_dev = std_dev($lung_var);
print "Std dev: $brain_std_dev, $heart_std_dev, $lung_std_dev.\n";

# Subfunction variance
sub variance{
	my @input = @_;
	my $sum_of_squares = 0;
	my $value_count = @input;
	foreach my $value (@input)
{   
	$sum_of_squares =
	  $sum_of_squares + ( $value - (mean_value(@input)) )**2;
}
	my $variance = $sum_of_squares / $value_count-1;
	return $variance;
}

# Subfunction mean value
sub mean_value{
	my @input = @_;
	my $input = @input;
	my $sum_value = 0;
	foreach my $value (@input)
{
	$sum_value = $sum_value + $value;
}
	my $mean = $sum_value / $input;
	return $mean;
}

# Subfunction standard deviation
sub std_dev{
	my $input = $_[0];
	my $std_dev = sqrt($input);
	return $std_dev;
}