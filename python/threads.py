#!/bin/env python3


import os
import requests
import threading



def astronauts():
    people = requests.get('http://api.open-notify.org/astros.json')
    print(people.text)


if __name__ == "__main__":

    for i in range(1000):
        thread = threading.Thread(target = astronauts())
        thread.start()
        print(threading.activeCount())
        print(threading.enumerate())
        print(f"This is Thread {i}")
        print(f"{thread}")
