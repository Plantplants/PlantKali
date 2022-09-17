#!/bin/bash

# kali 2022.3

echo 'Run as root'

userhome="/home/plantplants"
toolbox="/home/plantplants/toolbox"

apt update

# Setting up plantplants
usermod -l plantplants kali
usermod -d /home/plantplants -m plantplants
groupmod -n plantplants kali

# Backgrounds/logos
apt install -y kali-wallpapers-legacy
xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/kali-heart/kali-heart-wp-blue-1920x1080.jpg
cp /usr/share/backgrounds/kali-heart/kali-heart-wp-1920x1080.jpg /usr/share/desktop-base/kali-theme/login/background
curl 'https://upload.wikimedia.org/wikipedia/en/2/2d/SSU_Kirby_artwork.png' > /home/plantplants/Pictures/kirby.png
sed -i 's/#emblem-kali/\/home\/plantplants\/Pictures\/kirby.png/' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's/Kali-Light/Kali-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf

# Tools
mkdir $toolbox
cd $toolbox
echo '\nexport PATH="$PATH:$toolbox"' >> /home/plantplants/.zshrc

pip install droopescan
virtualenv -p /usr/bin/python2 $toolbox/python2env

# apt install
apt install seclists
