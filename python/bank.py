#!/bin/env python3



class Bank_Account:
    def __init__(self):
        self.balance = 0
        print(f"Here is your New Account with a balance of {self.balance}")

    def deposit(self):
        deposit = float(input("Enter the Amount of your Deposit:" ))
        self.balance += deposit
        print(f"{self.balance} is your current balance after Deposit.")
        
    def withdraw(self, amount):
        if self.balance < amount:
            raise ValueError("Insufficient Funds")
        self.balance -= amount
        print(f"New Balance is {self.balance} after withdrawal.")

    def current_situation():
        print(f"Current Balance: {balance}")

