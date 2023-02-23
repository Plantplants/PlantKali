#!/bin/bash

# kali 2022.4

echo 'Run as root'

userhome="/home/plantplants"
toolbox="/home/plantplants/toolbox"
zshrc="/home/plantplants/.zshrc"

apt update -y
apt upgrade -y

# Setting up plantplants
cd /home/kali
pkill -u kali pid ; pkill -9 -u kali
usermod -l plantplants kali
groupmod -n plantplants kali
usermod -m -d $userhome plantplants

# PATH
echo 'toolbox="/home/plantplants/toolbox"' >> $zshrc

# Setting up toolbox
mkdir $toolbox
chown plantplants:plantplants $toolbox
echo 'export PATH="$PATH:$toolbox"' >> $zshrc

# Backgrounds/logos
apt install -y kali-wallpapers-legacy
curl 'https://upload.wikimedia.org/wikipedia/en/2/2d/SSU_Kirby_artwork.png' > /usr/share/icons/hicolor/kirby.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image --set /usr/share/backgrounds/kali-heart/kali-heart-wp-blue-1920x1080.jpg
#cp /usr/share/backgrounds/kali-heart/kali-heart-wp-1920x1080.jpg /usr/share/desktop-base/kali-theme/login/background
sed -i 's/\/usr\/share\/desktop-base\/kali-theme\/login\/background/\/usr\/share\/backgrounds\/kali-heart\/kali-heart-wp-1920x1080.jpg/' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's/#emblem-kali/\/usr\/share\/icons\/hicolor\/kirby.png/' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's/Kali-Light/Kali-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf

# Tools
# Setup py2 and 3 venv
cd $toolbox
apt install python3.11-venv
su plantplants
python3 -m venv py3venv
source py3venv/bin/activate
pip install droopescan
deactivate
virtualenv -p /usr/bin/python2 $toolbox/py2venv
echo alias py2venv='source /home/plantplants/toolbox/py2venv/bin/activate' >> $zshrc
echo alias py3venv='source /home/plantplants/toolbox/py3venv/bin/activate' >> $zshrc
# Other tools
git clone https://github.com/ticarpi/jwt_tool.git
git clone https://github.com/internetwache/GitTools.git
git clone https://github.com/arthaud/git-dumper.git
git clone https://github.com/frohoff/ysoserial.git
git clone https://github.com/ambionics/phpggc.git
git clone https://github.com/GDSSecurity/GWT-Penetration-Testing-Toolset.git
# exit user plantplants
exit

## go
cd $userhome/Download
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
export PATH="$PATH:/usr/local/go/bin"
echo 'PATH="$PATH:/usr/local/go/bin"' >> $zshrc

# wordlist
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
#chmod +x $toolbox/setup.sh
