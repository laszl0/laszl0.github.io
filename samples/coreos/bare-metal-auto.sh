#!/bin/bash
mkdir coreos
cd coreos
sudo apt-get update
sudo apt-get install -y git golang-go whois
sudo apt-get update

cp /cdrom/cloud-config-generated.yml ./cloud-config.yml
git clone https://github.com/coreos/coreos-cloudinit

cd coreos-cloudinit
./build

cd bin
sudo cp coreos-cloudinit /usr/bin/coreos-cloudinit

cd ..
cd ..

wget https://raw.github.com/coreos/init/master/bin/coreos-install
sudo chmod 755 coreos-install
sudo ./coreos-install -d /dev/sda -c cloud-config.yml -C stable
