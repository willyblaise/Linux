#!/bin/bash



myarray=(`find ./ -maxdepth 1 -name "*.go"`)

[[ ! -d ~/go ]] && mkdir -p go || echo directory already exists

[[ ${#myarray[@]} -gt 0 ]] && mv ~/*.go ~/go || echo No GO files in this location
