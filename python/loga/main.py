import mathoperations as mo
from mathoperations import remainder
from Dog import Dog

# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('Champ')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
print(f"Michael Jordan number is: {mo.add(12, 11)}")
print(f"Remainder is: {remainder(10,4)}")

cool = Dog("Cool", 20, 10)
print(cool.__dict__)

cool.set_weight(18)
print(cool.get_weight())

first, second = mo.swap(12, 7)
print(f"First number after swap: {first}")
print(f"Second number after swap: {second}")