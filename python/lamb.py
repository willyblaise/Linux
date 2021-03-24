#!/bin/python


a = [1,2,3,4,5,6,7,8,9,10,11]

def filt(a):
    evens = list(filter(lambda x: x % 2 == 0, a))
    odds  = list(filter(lambda x: x % 2 != 0, a))
    print(f"This is the list of event {evens}")
    print(f"The following are the list of Odds: {odds}")


if __name__ == "__main__":
    filt(a)
    lsquared = [ i ** 2 for i in a ]
    print(lsquared)
