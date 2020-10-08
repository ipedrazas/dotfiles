#!/usr/bin/bash


# Update
sudo pacman -Syu

# Utils
sudo pacman -S binutils make gcc pkg-config fakeroot zsh vim neovim alacritty arandr spectrwm dmenu tree neofetch

# Development
sudo pacman -S git code clojure leiningen go python

# Containers
sudo pacman -S docker podman kubectl helm
