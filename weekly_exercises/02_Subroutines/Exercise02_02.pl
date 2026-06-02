# Write a program that uses if and while that does the following:
# • Asks the user to enter two odd numbers
# • Create an array that contains all odd numbers between them (including the
# entered numbers)
# • If the entered numbers are not odd the program should print an error
# message, and then stop.
# • If the first entered number is larger than the second one, the program should
# still be able to print all the odd numbers between them (and the numbers
# themselves) in descending order.
# • Print this array in descending order. 

use strict;
use warnings;

odd1:
print "Please enter an odd number of your choice:\n";
my $odd1 = (<>);
chomp($odd1);
if ( $odd1 % 2 == 0 ) {
	print "Your number is not an odd number, try again.\n";
	goto odd1;
}
else {
	goto odd2;
}

odd2:
print "Please insert a second odd number:\n";
my $odd2 = (<>);
chomp($odd2);
if ( $odd2 % 2 == 0 ) {
	print "Your second number is not an odd number, try again.\n";
	goto odd2;
}
else {
	goto checkpoint1;
}

checkpoint1:
# Checks wich one is the bigger number
if ( $odd1 < $odd2 ) {
	goto odd_list_general;
}
else {
	goto odd_list_reverse;
}

odd_list_general:
my @odd_list_general = odd_list_while( $odd1, $odd2 );
print
  "You have entered that the first number is smaller than the second one.\n";
print
"This is a list of all odd numbers between your chosen ones:\n@odd_list_general.\n";
goto end;

odd_list_reverse:
# Sort the inout first, this way the subfunction still works even if the first input is bigger than the second one
# Reverse the outcome, this way it is shown in descending order
my @sort_input = ( $odd1, $odd2 );
@sort_input = sort { $odd1 <=> $odd2 } @sort_input;
my @odd_list_reverse = reverse( odd_list_while(@sort_input) );
print "You have entered that the first number is bigger than the second one.\n";
print
"This is a list of all odd numbers between your chosen ones, in descending order:\n@odd_list_reverse\n";
goto end;

end:
print "Thank you for using this applicataion!";
print "Press [ENTER] to start this application again.\n";
<STDIN>;
goto odd1;

# Subfunction to determine all odd numbers between two odd numbers ()
sub odd_list_while {
	my ( $a, $b ) = @_;
	my @odd_list = ();
	while ( $a <= $b ) {
		push( @odd_list, $a );
		$a += 2;
	}
	return @odd_list;
}

# Note: the goto command is bad practice
# I found that out after I finished the program, and did not find the time to rewrite the code with subfunctions