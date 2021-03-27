#!/bin/env python3
from functools import reduce


def average(*nums):
    sum = 0
    for i in range(len(nums)):
        sum += nums[i]

    avg = sum / len(nums)
    return avg

def added(*args):
    sum = 0
    for i in range(len(args)):
        sum += args[i]

    return sum

if __name__ == "__main__":
    numbers = [1,3,4,5,5,9,9,8]
    summa = added(10,10,10,10,10)

    avg = average(1,2,3,4,5)

    print(f"sum from the added functions is {summa}")
    print(f"The average of the list is {avg}")
    reduced = reduce((lambda x, y: x + y), numbers)
    print(f"The numbers {reduced} turned out to be {reduce((lambda x, y: x + y), numbers)}")
