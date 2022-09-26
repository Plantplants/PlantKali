#!/bin/bash

# kali 2022.3

echo 'Run as root'

userhome="/home/plantplants"
toolbox="/home/plantplants/toolbox"

apt update
apt upgrade

# Setting up plantplants
cd /home/kali
pkill -u kali pid ; pkill -9 -u kali
usermod -l plantplants kali
groupmod -n plantplants kali
usermod -m -d /home/plantplants plantplants

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

## go
cd $userhome/Download
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
export PATH="$PATH:/usr/local/go/bin"
echo 'PATH="$PATH:/usr/local/go/bin"' >> /home/plantplants/.zshrc

# apt install
apt install seclists

# terminal
# /home/plantplants/.config/qterminal.org/qterminal.ini
sed -i 's/fontSize=10/fontSize=14/' /etc/default/console-setup/qterminal.ini

# setup.sh
#echo '#!/bin/bash\n xfconf-query -c xfce4-desktop
#  -p /backdrop/screen0/monitorVirtual1/workspace0/last-image
#  --set /usr/share/backgrounds/kali-heart/kali-heart-wp-blue-1920x1080.jpg'
#  > $toolbox/setup.sh
  
# permissions
chown plantplants:plantplants $toolbox
chown plantplants:plantplants $toolbox/*
chmod +x $toolbox/setup.sh
