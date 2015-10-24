#! /usr/bin/env bash

mkdir ~/.i3
cp ./i3.config ~/.i3/config
cp ./i3status.conf ~/.i3/

sudo apt-add-repository -y ppa:yktooo/ppa

sudo apt-get install -y i3 dunst i3lock zip lxappearance gtk-chtheme qt4-qtconfig indicator-sound-switcher gnome-icon-theme-full
wget http://cz.archive.ubuntu.com/ubuntu/pool/universe/i/i3status/i3status_2.9-2_amd64.deb
sudo dpkg -i i3status_2.9-2_amd64.deb
rm i3status_2.9-2_amd64.deb

# download fonts
wget https://fortawesome.github.io/Font-Awesome/assets/font-awesome-4.4.0.zip
unzip font-awesome-4.4.0.zip
mkdir -p ~/.fonts/truetype/font-awesome
cp font-awesome-4.4.0/fonts/fontawesome-webfont.ttf ~/.fonts/truetype/font-awesome
rm -rf font-awesome-4.4.0
rm font-awesome-4.4.0.zip

wget http://www.fontsquirrel.com/fonts/download/M-1m
unzip M-1m
mkdir -p ~/.fonts/truetype/M-1m
cp mplus-*.ttf ~/.fonts/truetype/M-1m
rm M-1m
rm *.ttf
rm M+*.*

wget https://github.com/driftyco/ionicons/archive/v2.0.1.zip
unzip v2.0.1.zip
mkdir -p ~/.fonts/truetype/font-awesome-4.4.0
cp ionicons-2.0.1/fonts/ionicons.ttf ~/.fonts/truetype/ionicons
rm -rf ionicons-2.0.1
rm v2.0.1.zip

# refresh fonts
sudo fc-cache -f -v

# automount usb drives 
cp 10-usb-mount.rules /etc/udev/rules.d
udevadm control --reload-rules
