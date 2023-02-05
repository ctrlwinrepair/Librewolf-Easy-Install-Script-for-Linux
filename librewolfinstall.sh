#!/bin/bash

distro=$(if echo " bullseye focal impish jammy uma una " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
#Distro check
echo "deb [arch=amd64] http://deb.librewolf.net $distro main" | sudo tee /etc/apt/sources.list.d/librewolf.list
#Imports the apt source
sudo wget https://deb.librewolf.net/keyring.gpg -O /etc/apt/trusted.gpg.d/librewolf.gpg
#Imports the signed key, attach to keyring
sudo apt update
#Update
sudo apt install librewolf -y
#Install librewolf from apt
