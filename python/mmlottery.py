import random
from datetime import date


def mega_millions(tickets):
    #Initialise an empty list that will be used to store the 6 lucky numbers!
    lotteryNumbers = []
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

if __name__ == "__main__":
    tickets = int(input("Please provide the number of tickets you would like: "))
    print(f">>> Mega Millions lottery numbers for {date.today()}: ") 
    mega_millions(tickets)

