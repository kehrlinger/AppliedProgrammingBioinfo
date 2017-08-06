# First exercise in Python using PyCharm
""" Write a program that finds the minimal number listed behind each of the tissues
below. Write a function that returns the lowest number for a given list of numbers
using a for or a while loop together with if. Print the name of each tissue and the
minimal activity to screen."""

brain = [65, 69, 70, 63, 68]
heart = [102, 95, 98, 110]
lung = [112, 115, 113, 109, 95, 98, 100]
organ_list = [brain, heart, lung]

for i in organ_list:
    print(min(i))
