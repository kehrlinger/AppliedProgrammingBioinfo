# Read the values in the file “names.txt” and store them in a hash with the name as
# key and the country as the value.
# Print the name – place pairs in alphabetical order of the name to screen.
# Then implement a function called “get_country_by_name” that takes a name and
# your hash as arguments (use a reference for the hash!), and returns the country as
# a scalar. Test this by sending one of the names to the function, and print the
# returned value. Does lower case/upper case matter in the hash?

use strict;
use warnings;

my %names = ( #define the hash
	Barack   => "usa",
	luke     => "tatooine",
	Katarina => "noxus",
	borat    => "kazakstan",
	arwen    => "rivendell",
	Sombra   => "mexico",
	aloy     => "sacred lands"
);
foreach my $chars ( sort { lc $a cmp lc $b } keys(%names) ) { # Sort the chars lexically, case insensitive
	print "$chars: $names{$chars}\n";
}

print "Please enter a key you want to check the corresponding value for:\n(Remember that this input will be handled case sensitive)\n";
my $input = (<>);
chomp($input);
my $value = get_name_from_hash( \%names, $input );
print "The corresponding value to $input is $value.\n";
print "Thank you for using this application!\n";

sub get_name_from_hash {
	my ( $hashref, $name ) = @_;
	my %input_hash   = %{$hashref};
	my $output_value = $input_hash{$name};
	return $output_value;
}
