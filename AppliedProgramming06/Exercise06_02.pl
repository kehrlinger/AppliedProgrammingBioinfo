# Create a perl script using DBI to access your database and extract and or insert
# information, either in one block or interactively

use DBI;
use strict;
use warnings;

print "Please enter your username on the MySQL databse:\n";
my $db_user = <STDIN>;
chomp $db_user;

print "Please enter the database you want to use for your query:\n";
my $db_name = <STDIN>;
chomp $db_name;

print "Please enter the password for the user you chose earlier:\n";
my $db_pwd = <STDIN>;
chomp $db_pwd;

print "Enter the name of the table you would like to work with:\n";
my $db_table = <STDIN>;
chomp $db_table;

# Open the connection to the desired DB
my $dbh = DBI->connect("DBI:mysql:database=$db_name", $db_user, $db_pwd);

# Get the names of the table to display to the user
my $query_col_names = $dbh->prepare("describe $db_table");
$query_col_names->execute() or
	die '$query_col_names->err_str()';
my @column_names;
while (my @row = $query_col_names->fetchrow_array()) {
	my @column_names = push(@column_names, $row[0]);
}

# Print the table to display to the user
my $query_get_table = $dbh->prepare('select * from pets');
$query_get_table->execute() or
	die '$query_get_table->err_str()';
	print "This is how your table looks like at the moment:\n\n@column_names\n";
while (my @row = $query_get_table->fetchrow_array()) {
	my $row = join ("\t", @row);
	print "$row\n";
}

# Let the user add an entry into the table
print "\n\nIf you want to add another entry to the table, enter the values below.\n"
	."The value should be marked by single ' and delimited by comma.\nExample: 'test1', 'test2',....\n@column_names\n";
my $table_input = <STDIN>;
chomp $table_input;
my $query_add_entry = $dbh->prepare("insert into $db_table values ($table_input)");
$query_add_entry->execute() or
	die '$query_add_entry->err_str()';

# Display the table for the user to check for correctness
my $query_updated_table = $dbh->prepare("select * from pets");
$query_updated_table->execute() or
	die '$query_updated_table->err_str()';
	my @updated_table_content;
while (my @row = $query_updated_table->fetchrow_array()) {
	my $row = join ("\t", @row);
	print "$row\n";
}

# Kill the connection to the DB
$dbh->disconnect();
