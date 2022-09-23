#!/bin/bash

# kali 2022.3

echo 'Run as root'

userhome="/home/plantplants"
toolbox="/home/plantplants/toolbox"

# apt update
# apt upgrade

# Setting up plantplants
pkill -u kali pid ; pkill -9 -u kali
usermod -l plantplants kali
groupmod -n plantplants kali
usermod -d /home/plantplants -m plantplants

# Setting up toolbox
mkdir $toolbox
echo 'export PATH="$PATH:$toolbox"' >> /home/plantplants/.zshrc

# Backgrounds/logos
apt install -y kali-wallpapers-legacy
curl 'https://upload.wikimedia.org/wikipedia/en/2/2d/SSU_Kirby_artwork.png' > /home/plantplants/Pictures/kirby.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/kali-heart/kali-heart-wp-blue-1920x1080.jpg
cp /usr/share/backgrounds/kali-heart/kali-heart-wp-1920x1080.jpg /usr/share/desktop-base/kali-theme/login/background
sed -i 's/#emblem-kali/\/home\/plantplants\/Pictures\/kirby.png/' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's/Kali-Light/Kali-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf

# Tools

# installation conflict
# pip install droopescan --target $toolbox/droopescan

virtualenv -p /usr/bin/python2 $toolbox/python2env
echo 'export PATH="$PATH:$toolbox/python2env/bin"' >> /home/plantplants/.zshrc

# apt install
# apt install seclists
