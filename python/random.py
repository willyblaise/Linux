import random
import time


start = time.time()

tickets = int(input("Please provide the number of tickets you would like: "))

#Initialise an empty list that will be used to store the 6 lucky numbers!
lotteryNumbers = []

print(f">>> Today's Mega Millions lottery numbers are: ") 

while tickets > 0:
    for i in range (1,6):
        number = random.randint(1,71)
    #Check if this number has already been picked and ...
        while number in lotteryNumbers:
        # ... if it has, pick a new number instead 
            number = random.randint(1,51)
        
        #Now that we have a unique number, let's append it to our list.
        lotteryNumbers.append(number)

        #Sort the list in ascending order
    lotteryNumbers.sort()
    lotteryNumbers.append("--")
    lotteryNumbers.append(random.randint(1,26))
    lotteryNumbers = str(lotteryNumbers)[1:-1].replace(",","").replace("'","")
    print(f"{lotteryNumbers}")
    lotteryNumbers = []
    tickets -= 1

stop = time.time()

total = stop - start

printf(f"Time to run is {total}")
