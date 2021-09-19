import os
import random
import math

fruits = ["apple", "banana", "kiwi", "pear"]
family = ["Champ", "Nicole", "Bray", "Logan", "The Baby", "Cool", "Ted"]


for i, fruit in enumerate(fruits):
    print(f"{i + 1}: {fruit}")

print("")    

for name, member in enumerate(family):
    if member == "Champ":
        print(f"Father: {member}")
    elif member == "Nicole":
        print(f"Mother: {member}")
    elif member == "Bray":
        print(f"First Child: {member}")
    elif member == "Logan":
        print(f"My First: {member}")
    elif member == "Cool":
        print(f"Champ Dog: {member}")
    elif member == "Ted":
        print(f"Bray Dog: {member}")
    else:
        print(f"{name + 1} Coming Soon: {member}")