# Rewrite02_01

prompt = input("Press 'y' and confirm with [ENTER] to start the script")

while prompt == "y": #This way the program will be started over after its done
    odd1 = int(input("Please enter a positive, odd number of your choice: "))
    odd2 = int(input("Please enter another positive odd number of your choice: "))

    while odd1 % 2 == 0: #Let user input until odd1 is odd
        print("The first number is not an odd number you prick!")
        odd1 = int(input("Try again: "))

    while odd2 % 2 == 0:
        print("The second number is not an odd number you prick!")
        odd2 = int(input("Try again: "))

    number_inv = []
    if odd1 > odd2: #Interchange odd1 and odd2 if the first one is the bigger one
        number_inv.append(odd2)
        number_inv.append(odd1)
        odd1 = number_inv[0]
        odd2 = number_inv[1]

    odd_list = [] #Compute the numbers
    while odd1 <= odd2:
        odd_list.append(odd1)
        odd1 += 2

    odd_list.reverse() #Reverse the list
    print(odd_list)
    prompt = input("Press 'y' and confirm with [ENTER] to start the script again.\n Press any other kea to finish.")