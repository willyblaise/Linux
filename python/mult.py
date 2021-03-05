import math




def add():
    val1 = int(input("please provide the first value: "))
    val2 = int(input("please provide the second value: "))
    return val1 + val2

def square():
    sum = add()
    sum_squared = sum ** 2
    return print("The sum squared is: ", sum_squared)

square()
