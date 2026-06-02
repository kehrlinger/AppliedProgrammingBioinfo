# Addendum to the first exercise
"""Write a script that gets the minimum of a list of user-provided elements.
Different subfunctions are available, uncomment to choose the desired one."""


user_input = input("Please enter the values you want to get the minimum of (separated only by single whitespace): ")


def minimum_of_string(input_string):
    input_list = input_string.split()  # so far input is a string, this splits it into a list
    input_list = [float(x) for x in input_list]  # every element of the list is converted into floats
    minimum = float("inf")  # infinite, first element is certainly smaller, as long as infinite is not in the list
    for i in input_list:
        if minimum > i:
            minimum = i
    return minimum


# def minimum_of_string(input_string):
#   value_list = input_string.split()
#   value_list = list(map(int, value_list)) #converts all the elements of the list into integers
#   return min(value_list) #built-in function

# the while method does unfortunately not work, but I really dont want to bother with it anymore, the other two are shorter anyway
# def minimum_of_string(input_string):
#    input_list = input_string.split()
#    input_list = [int(x) for x in input_list]
#    minimum = float("inf")
#    i = 0
#    while i < len(input_list):
#        if minimum > i:
#            minimum = i
#        i += 1
#    return minimum

print(minimum_of_string(user_input))
