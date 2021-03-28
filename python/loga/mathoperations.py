
def add(x: int, y: int) -> int:
    return x + y

def subtract(x: int, y: int) -> int:
    return x -y

def remainder(x: int, y: int) -> int:
    return x % y

def multiply(x: int, y: int) -> int:
    return x * y


def divide(x: int, y: int) -> int:
    return x / y

def swap(first: int, second: int) -> int:
    print(f"first number prior to swap: {first}")
    print(f"second number prior to swap: {second}")
    first  = first - second
    second = first + second
    first  = second - first
    return first, second

