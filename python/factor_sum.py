
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

if __name__ == "__main__":
    sum = add()
    print(sum)

    res = int(input("Please provide the numbers you want to sum: "))
    total = add_numbers(res)
    factorial = factor(res)
    print(f"{res}! is {factor(res)}")
    print(f"Your sum for numbers up to {res} is {add_numbers(res)}")

    print(f"total is {total} and factorial is {factorial}")