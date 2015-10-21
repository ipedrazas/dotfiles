#! /usr/bin/env bash

sudo apt-get install -y i3 dunst i3lock
wget http://cz.archive.ubuntu.com/ubuntu/pool/universe/i/i3status/i3status_2.9-2_amd64.deb
sudo dpkg -i i3status_2.9-2_amd64.deb
rm i3status_2.9-2_amd64.deb
