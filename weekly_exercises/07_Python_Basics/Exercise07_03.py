#Third exercise in python
"""Read the values in the file “names.txt” and store them in a dictionary with the name
as key and the country as the value. Print the name – place pairs in alphabetical
order of the name to screen.
Then implement a function called “get_country_by_name” that takes a name and
your dictionary as arguments, and returns the country. Test this by sending a name
to the function, and print the returned value."""

input_path = "names.txt"

with open(input_path, 'r') as fh_input:
    file_content = fh_input.readlines() # A list, every element is a line of th file

for i in range(len(file_content)):
    file_content[i] = file_content[i].rstrip('\n') # Basically 'chomp' from perl
    file_content[i] = file_content[i].split('\t') # Every element (= line of the file) is now a new list

names = {}
for i in file_content:
    names[str.lower(i[0])] = str.lower(i[1]) # Fill the dictionary with the two elements of each line

for key, value in sorted(names.items()):
    print ("%s: %s" % (key, value))

def get_country_by_names(dictionary, name):
    name = name.lower()
    return dictionary[name]

request = input("Please enter a name you want to get the country from: \n")

print (get_country_by_names(names, request))