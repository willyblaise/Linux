#!/bin/bash



count=`ls *.py 2>/dev/null | wc -l`


[[ ! -d ~/python_raw ]] && mkdir -p python_raw || echo directory already exists

[[ $count > 0 ]] && mv ~/*.py ~/python_raw || echo No python files in this location
