#!/bin/bash
# minimal statusbar info : Spandan # github.com/spandanji

hdd(){
	hdd="$(df -h | grep "/dev/mapper/vgxubuntu-root" | awk '{print $3, $5}')"
	echo -e "HD : $hdd"
}

hdd_data(){
    data="$(df -h | grep sda2 | awk '{print $3, $5}')"
    echo -e "DATA : $data" 
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
    echo "$(cpu) || $(hdd) || $(hdd_data) || $(mem) ||  $(vol)" 
	sleep $SLEEP_SEC
done
