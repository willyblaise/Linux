
import sys


def add(x: int=2, y: int=10) -> int:
    return x + y

def sum_down():
    global sum
    while sum > 1:
        print(f"sum: {sum}")
        sum -= 1

if __name__ == "__main__":
    
    print(f"{len(sys.argv)} arguments were passed in.")

    if len(sys.argv) < 2:
        print("Please enter at least 2 Arguments.")
        sys.exit()
    
    x = int(sys.argv[1])
    y = int(sys.argv[2])

    sum = add(x,y)

    print(f"Sum Initially: {sum}")

    sum_down()

    l1 = ["champ", "nicole", "bg"]

    for x in l1:
        print(x)

    l1.pop()
    print(l1)

    l1.append("cool")
    print(l1)
