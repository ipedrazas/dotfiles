#! /usr/bin/env bash

# Chrome
sudo apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    gconf-service \
    hicolor-icon-theme \
    libappindicator1 \
    libasound2 \
    libcanberra-gtk-module \
    libcurl3 \
    libexif-dev \
    libgconf-2-4 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libnspr4 \
    libnss3 \
    libpango1.0-0 \
    libv4l-0 \
    libxss1 \
    libxtst6 
    
wget https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-beta_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm *.deb
