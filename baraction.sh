#!/bin/bash
# Example Bar Action Script for Linux.
# Requires: acpi, iostat, lm-sensors, aptitude.
# Tested on: Debian Testing
# This config can be found on github.com/linuxdabbler

############################## 
#	    DATE
##############################

date() {
	  date="$(date +"%a, %b %d %R")"
	    echo -e " $dte "
    }

############################## 
#	    DISK
##############################

hdd() {
	  hdd="$(df -h /home | grep /dev | awk '{print $3 "/" $5}')"
	    echo -e " HDD: $hdd "
    }
##############################
#	    RAM
##############################

mem() {
    mem=$(free -h | awk '/Mem:/ {printf ($3/$2)*100 }')
    percent_mem=$(printf "%.0f" $mem)
	echo -e " Mem: $percent_mem%"
}
##############################	
#	    CPU
##############################

cpu() {
	  read cpu a b c previdle rest < /proc/stat
	    prevtotal=$((a+b+c+previdle))
	      sleep 0.5
	        read cpu a b c idle rest < /proc/stat
		  total=$((a+b+c+idle))
		    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
		      echo -e " CPU: $cpu% "
	      }
##############################
#	    AUDIO
##############################
mic() {
    # -c 0 gets the usb mic
    mic=$(amixer -c 0 get Mic | awk -F'[][]' 'END{ print "[" $2 "]: "$6 }')
    echo -e " Mic $mic"
}

vol() {
	vol="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print "[" $4 "]: "$2 }')"
	echo -e " Vol $vol "
}
##############################
#	    Packages
##############################

pkgs() {
	pkgs="$(apt list --installed | wc -l)"
	echo -e " Packages: $pkgs "
}
##############################
#	    UPGRADES
##############################

upgrades() {
	upgrades="$(aptitude search '~U' | wc -l)"
	echo -e " Upgrades: $upgrades "
}
##############################
#	    VPN
##############################

vpn() {
	vpn="$(ip a | grep tun0 | grep inet | wc -l)"
	echo -e " VPN: $vpn "
}

public_ip(){
    pub_ip=$(curl 'https://api.ipify.org?format=txt')
    echo -e "$pub_ip"
}
## WEATHER
weather() {
    wthr="$(cat ~/.config/weather.json | jq '.current_condition[0].weatherDesc[0].value' --raw-output)"
	echo " $wthr"
}

## TEMP
temp() {
    tmp="$(cat ~/.config/weather.json | jq '.current_condition[0].temp_C' --raw-output)"
	echo " $tmp"
}


SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do     
#This bar is for spectrwm 3.3+
    echo "+@fg=5;$(cpu) +@fg=0;| +@fg=2;$(mem) +@fg=0;| +@fg=1;$(mic) +@fg=0;| +@fg=3;$(vpn)[$(public_ip)]+@fg=0;| +@fg=4;$(vol)+@fg=0;|+@fg=2;$(weather) ($(temp)°) +@fg=0;|"
	sleep $SLEEP_SEC
done
