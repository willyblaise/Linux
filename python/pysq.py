
def add(x,y):
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

