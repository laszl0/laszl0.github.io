#!/bin/bash
cd ~

sudo apt-get update
sudo apt-get install -y git curl bzip2
sudo apt-get update

# only for ubuntu 16.04 LTS Live
# to have systemd-nspawn available
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install systemd-container
sudo apt-get update

git clone https://github.com/Clarifai/coreos-nvidia
cd coreos-nvidia
./build.sh --keep 375.66 stable 1409.7.0
