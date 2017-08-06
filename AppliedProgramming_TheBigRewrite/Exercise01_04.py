# Rewrite01_04

import math

brain = [65, 69, 70, 63, 70, 68]
heart = [102, 95, 98, 110]
lung = [112, 115, 113, 109, 95, 98, 100]
tissues = [brain, heart, lung]


def average(list):
    sum_of_list = float()
    for i in list:
        sum_of_list = sum_of_list + float(i)  # alternative: sum_of_list += float(x)
    avg = sum_of_list / len(list)
    return (avg)


def variance(list):
    sum_of_squares = float()
    for i in list:
        sum_of_squares += (i - average(list)) ** 2
    variance = 1 / len(list) * sum_of_squares
    return variance


loopcount = int()
for t in tissues:
    loopcount += 1
    print("Number of measurements in tissue #" + str(loopcount) + " = " + str(len(t)))
    print("Average enzyme activity in tissue #" + str(loopcount) + " = " + str(average(t)))
    print("Variance of enzyme activity in tissue #" + str(loopcount) + " = " + str(average(t)))
    print("Standard deviation of enzyme activity in tissue #" + str(loopcount) + " = " + str(average(t)) + "\n")
