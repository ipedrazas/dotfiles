#!/bin/bash

# Directory Containing the Pictures
DIR="$HOME/.config/backgrounds"

# Command to Select wallpapers at random from the $DIR directory
WALLPAPER=$(ls $DIR | shuf -n1)

# Set Desktop Wallpaper
feh --bg-scale ${DIR}/${WALLPAPER}
