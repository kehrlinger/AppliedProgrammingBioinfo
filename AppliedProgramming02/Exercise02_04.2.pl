# Continued 04_01: ...or: use split (perldoc.perl.org) to generate an array of values, and loop over that
# array

use strict;
use warnings;

print "Please enter a sequence of your choice:\n";
my $seq=<STDIN>;
chomp ($seq);
$seq = lc($seq); # Convert everything in lowercase
print "Now,please enter which base you want to count in this sequence:\n";
my $base=<STDIN>;
chomp ($base);
$base = lc($base);
my $base_count = base_count_split($seq, $base);
base_count_output($base_count);
print "Thank you for using this application.\n";

# Subfunction output decision
# This was only done to practice loop-construction
sub base_count_output {
	$base_count = $_[0];
	if ($base_count >= 2){
	print "Your sequence has $base_count '$base' in it.\n";
} elsif ($base_count == 1) {
	print "There is $base_count '$base' in your sequence.\n";
} else {
	print "There are $base_count '$base' in your sequence.\n";
}
}

# Subfunction basecount, using the split command
sub base_count_split{
	my @seq1=@_;
	my $base = pop(@seq1); # Pop has to be used to make the sequence string the only element in the array
	my @base_count;
	@seq1=split(//, $seq1[0]); # Creates an array with every element of the array being one letter of the input sequence
 foreach $b (@seq1){
	if ($b eq $base) {
		 push (@base_count, $b)
	}
}
my $base_count = @base_count;
return "$base_count";
}