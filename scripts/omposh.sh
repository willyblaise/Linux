#!/bin/bash

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sleep 5
sudo chmod +x /usr/local/bin/oh-my-posh

#get themes
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sleep 3
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
sleep 3
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip


echo "eval "$(oh-my-posh prompt init bash)"" >> ~/.bashrc
