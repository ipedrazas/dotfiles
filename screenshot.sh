#! /usr/bin/bash

droppath="/home/ivan/Dropbox/Public/screenshots/";
now=`date +"%m_%d_%Y_%T"`;
fimage="$now.png";
`scrot $fimage`;
`mv $fimage $droppath`;
link=`dropbox puburl "$droppath$fimage"`;
echo -n $link | xclip -selection c

