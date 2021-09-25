#!/bin/bash

#sudo raspi-config
#add name=kube4.pidramble.com address=192.168.88.15
# /ip dns static
#sudo /bin/bash -c "echo 'deb [arch=armhf] https://aptmirror-win-vm.vla8islav-local.com:3142/download.docker.com/linux/debian/ buster stable' > /etc/apt/sources.list.d/docker.list"

sudo apt install curl -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=armhf signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo /bin/bash -c "sed -i 's/raspbian.raspberrypi.org/aptmirror-win-vm.vla8islav-local.com:3142\/raspbian.raspberrypi.org/g' /etc/apt/sources.list"
sudo /bin/bash -c "sed -i 's/archive.raspberrypi.org/aptmirror-win-vm.vla8islav-local.com:3142\/archive.raspberrypi.org/g' /etc/apt/sources.list.d/raspi.list"
sudo rm -rf /var/lib/apt/lists/
sudo rm -rf /var/cache/apt/*
sudo apt update
