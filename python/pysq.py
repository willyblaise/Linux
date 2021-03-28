#!/bin/env python3

import bank


def add(x: int,y: int) -> int:
    return x + y


def sqUp():
    try:
        a = int(input("please give me the first number: "))
        b = int(input("please give me the 2nd number: " ))
    except ValueError:
        print("The value needs to be Something that can be Calculated.")

    sum = add(a,b)
    squared = sum * sum
    return print("{} squared is {}".format(sum, squared))


if __name__ == "__main__":
    sqUp()

    checking = bank.Bank_Account()

    checking.deposit()
    checking.withdraw()
    print(checking.__dict__)
    nb = checking.get_balance()
    print(f"final balance is {nb}")
