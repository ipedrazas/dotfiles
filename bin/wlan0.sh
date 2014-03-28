#! /bin/bash

sudo ifconfig wlan0
sudo iwconfig wlan0 essid EMA-WIFI
sudo dhclient
