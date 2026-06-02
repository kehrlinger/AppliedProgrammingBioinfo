# Write an iterative subroutine that computes N factorial. The program should ask the
# user for an integer number N, and output N! The program should return an error
# message if the entered number is not a positive whole number.
# Hint: you can convert the input number to the nearest integer using the function $integer
# = int($number), and then compare that value to the input to see if they are equal.

use strict;
use warnings;

start:
print
"Please enter a positive, whole number you want to compute the factorial of:\n";
my $input = <STDIN>;
chomp($input);
my $integer_input = int($input);
if ( ( $integer_input != $input ) or ( $input < 1 ) ) {
	print "The input is not a positive whole number!\nYour input was $input\n";
	goto start;
}
else {
	my $factorial = factorial($input);
	print
"The factorial of your input is $factorial\nThank you for using this application!\nPress enter to start from the beginning.\n";
}
<STDIN>;
goto start;

sub factorial {
	my $var      = $_[0];
	my $var_fact = 1;
	while ( $var >= 1 ) {
		$var_fact = $var_fact * $var;
		$var -= 1;
	}
	return $var_fact;
}
