# Rewrite the program 02_02, using a for loop instead of a while loop

use strict;
use warnings;

odd1:
print "Please enter an odd number of your choice:\n";
my $odd1 = (<>);
chomp($odd1);
if ( $odd1 % 2 == 0 ) { # '%'=modulo operator
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
	goto odd_list1;
}
else {
	goto odd_list_reverse;
}

odd_list1:
my @odd_list_general = odd_list( $odd1, $odd2 );
print
  "You have entered that the first number is smaller than the second one.\n";
print
"This is a list of all odd numbers between your chosen ones:\n@odd_list_general\n";
goto end;

odd_list_reverse:
# Sort the inout first, this way the subfunction still works even if the first input is bigger than the second one
# Reverse the outcome, this way it is shown in descending order
my @sort_input = ( $odd1, $odd2 );
@sort_input = sort { $odd1 <=> $odd2 } @sort_input;
print "@sort_input\n";
my @odd_list_reverse = reverse( odd_list(@sort_input) );
print "You have entered that the first number is bigger than the second one.\n";
print
"This is a list of all odd numbers between your chosen ones, in descending order:\n@odd_list_reverse\n";
goto end;

end:
print "Thank you for using this application.\n";
print "Press [ENTER] to start this application again.\n";
<STDIN>;
goto odd1;

# Subfunction to determine all odd numbers between two given numbers (for loop)
sub odd_list {
	( $a, $b ) = @_;
	my @odd_list;
	for ( $a ; $a <= $b ; $a += 2 ) {
		push( @odd_list, $a );
	}
	return @odd_list;
}

# Note: the goto command is bad practice I found that out after I finished the program, and did not find the time to rewrite the code with subfunctions.
# Also i was not able to find out why i got a warning in line 69, program works fine though; pull request still highly encouraged