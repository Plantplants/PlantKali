#!/bin/bash

# kali 2022.3

echo 'Run as root'

# Setting up plantplants
usermod -l plantplants kali
usermod -d /home/plantplants -m plantplants
groupmod -n plantplants kali
apt update


cd /home/plantplants
mkdir toolbox
cd toolbox

# Background
apt install -y kali-wallpapers-legacy
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/kali-heart/kali-heart-wp-blue-1920x1080.jpg
