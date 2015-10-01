#!/bin/sh -e

# Lock screen displaying this image.
i3lock -i ~/.i3/screen_locked.png -t
# rotate lock screen wallpaper
/home/ivan/dotfiles/bin/lock-gallery -d /home/ivan/backgrounds/ -t /home/ivan/.i3/screen_locked.png 
# Turn the screen off after a delay.
sleep 160; pgrep i3lock && xset dpms force off
