#!/bin/env python3



class Bank_Account:
    def __init__(self, balance = 0, typeacct = "checking"):
        self.type = typeacct
        self.balance = balance
        print(f"Here is your New Account with a balance of {self.balance}")

    def deposit(self):
        deposit = float(input("Enter the Amount of your Deposit:" ))
        self.balance += deposit
        print(f"{self.balance} is your current balance after Deposit.")
        
    def withdraw(self):
        amount = float(input("How much do you want to withdraw?"))
        if self.balance < amount:
            raise ValueError("Insufficient Funds")
        self.balance -= amount
        print(f"New Balance is {self.balance} after withdrawal.")

    def get_balance(self):
        print("Getting Balance")
        return self.balance
    
    def set_balance(self, value):
        print("Setting Balance")
        self.balance = value
        

    #balance = property(get_balance, set_balance)
