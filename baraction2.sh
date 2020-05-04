#!/bin/bash
# minimal statusbar info : Spandan # github.com/spandanji

hdd(){
	hdd="$(df -h | awk 'NR==4{print $3, $5}')"
	echo -e "HD : $hdd"
}

mem(){
	mem="$(free | awk '/Mem/ {printf "%d MiB / %d MiB : %d%\n", $3 / 1024.0, $2 / 1024.0,  $3/$2 *100}')"
	echo -e "MEM : $mem"
}


cpu() {
	read cpu a b c previdle rest < /proc/stat
  	prevtotal=$((a+b+c+previdle))
  	sleep 0.5
  	read cpu a b c idle rest < /proc/stat

	total=$((a+b+c+idle))
 	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo -e "CPU: $cpu%"
}

vol(){
	x="$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $5 }')"
	if [ $x = "off" ]
	then
		vol="MUTE"
	else
		vol="$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')"
	fi
	echo -e "VOL: $vol"
}


SLEEP_SEC=0.5
while :; do
	echo "$(cpu) || $(hdd) || $(mem) ||  $(vol)" 
	sleep $SLEEP_SEC
done
