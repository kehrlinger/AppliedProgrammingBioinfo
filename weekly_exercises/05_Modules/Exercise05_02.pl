# Install the module Text::Soundex. Check its documentation using perldoc. Write a
# simple script that uses it.

use strict;
use warnings;
use Text::Soundex;


print "Enter your last name.\n
This application will then assign a random password for your account that you can change after the first login.\n
Name:\n";
my $input = <STDIN>;
chomp $input;

print "Your temporary password for your new account is: " . soundex($input);