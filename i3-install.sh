#! /usr/bin/env bash

sudo apt-get install -y i3 dunst i3lock zip
wget http://cz.archive.ubuntu.com/ubuntu/pool/universe/i/i3status/i3status_2.9-2_amd64.deb
sudo dpkg -i i3status_2.9-2_amd64.deb
rm i3status_2.9-2_amd64.deb

# download fonts
wget https://fortawesome.github.io/Font-Awesome/assets/font-awesome-4.4.0.zip
unzip font-awesome-4.4.0.zip
cp font-awesome-4.4.0/fonts/fontawesome-webfont.ttf ~/.i3
rm -rf font-awesome-4.4.0

wget http://www.fontsquirrel.com/fonts/download/M-1m
unzip M-1m.zip
cp mplus-*.ttf ~/.i3
