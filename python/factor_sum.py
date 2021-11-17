import time


def add_numbers(num: int) -> int:
    if num != 0:
        #print(f"current num is: {num}")
        return num + add_numbers(num-1)
    else:
        return num


def add(x: int = 2, y: int = 5) -> int:
    return x + y


def factor(numb: int) -> int:
    if numb >= 1:
        return numb * factor(numb-1)
    else:
        return 1

def average(*args):
    length = len(args)
    total = 0

    if length > 0:
        for val in args:
            total += val

    return total/length



if __name__ == "__main__":
    
    start = time.time()
    nums = []

    value = int(input("How many values would you like to input? "))

    for i in range(value):
        elem = int(input("Please enter the numbers you want to add: "))
        nums.append(elem)

    
    print(f"Number Array from standard in: {nums}")

    #testing a method with random amount of args
    mean = average(20,40,60)

    print(f"The average based on the numbers provided is: {mean}")

    sum = add()
    print(f"Default sum is equal to: {sum}")

    res = int(input("Please provide the number you want to sum: "))
    total = add_numbers(res)

    factorial = factor(res)
    print(f"total is {total} and factorial is {factorial}")
    
    print(f"{res}! is {factor(res)}")
    print(f"Your sum for numbers up to {res} is {add_numbers(res)}")

    stop = time.time()

    rtime = stop - start

    print(f"Total time to run in : {rtime}")
