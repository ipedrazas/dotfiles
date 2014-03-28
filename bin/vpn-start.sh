#!/bin/bash
# establishes VPN connection with HMA 
# Created 3 Jan 2012 by aaron . ciuffo at gmail
# number of connection attempts
ATT=5
LOGFILE=/var/log/hma-vpn.log
# URL for configuration information
LIST="http://vpn.hidemyass.com/vpnconfig/countries.php"
CLCONF="http://vpn.hidemyass.com/vpnconfig/client_config.php?win=1&loc="
# location of HMA configuration files
CONFIG="/usr/local/bin/vpn"


# display usage information
if [ $# == 0 ] || [ $# -gt 2 ]; then echo "Usage: $0 [OPTION]"; exit 1; fi


# change to the current directory 
cd $(dirname $0)


# Attempt to connect
while [ $ATT -gt 0 ] 
do
# ???
fun () { echo "$1"| sed 's/ /+/g' ; }


# Attempt to run VPN service
case "$1" in
        -l)     curl -s $LIST; exit ;;


        -ip)    [ "$2" ] && TMP=$(fun "$2") && \
                a=$(curl -s "$CLCONF$TMP"| tail| grep remote| cut -d " " -f 2) && \
                [ "$a" ] && echo -n "$2: $a" && echo || \
                echo "Invalid host! "
                exit ;;
                
        -r)     TMP=$(curl -s $LIST| sort -R| head -n 1| sed 's/[ \t]*$//') ;;


        -i)     [ "$2" ] && TMP=$(curl -s $LIST| grep "$2"| sort -R| head -n 1| sed 's/[ \t]*$//')
                [ ! "$TMP" ] && echo "Keyword not found." ;;


        -o)     [ "$2" ] && TMP=$(curl -s $LIST| grep -v "$2"| sort -R| head -n 1| sed 's/[ \t]*$//')
                [ ! "$TMP" ] && echo "Keyword not found." ;;


        *)      curl -s $LIST| sed 's/[ \t]*$//'| grep -x "$1" && TMP="$1" || echo "Unknown argument! " ;;
esac


 echo "###################" | tee -a $LOGFILE
 echo "$ATT Attempts left" | tee -a $LOGFILE
 echo `date` | tee -a $LOGFILE
 echo "###################" | tee -a $LOGFILE
 (( ATT-- ))




 [ "$TMP" ] && VPN=$(fun "$TMP") || exit 2


 echo "VPN chosen: $TMP" | tee -a $LOGFILE
 curl -s "$CLCONF$VPN" > "$CONFIG/client.cfg"
 [ -f "$CONFIG/hmaauth.conf" ] && \
 openvpn --remap-usr1 SIGTERM --dev tun0 --config $CONFIG/client.cfg --auth-user-pass $CONFIG/hmaauth.conf | tee -a $LOGFILE || \
 openvpn --remap-usr1 SIGTERM --dev tun0 --config $CONFIG/client.cfg | tee -a $LOGFILE
 
done
echo "Maximum attempts reached. Failed to connect to VPN. Exiting." | tee -a $LOGFILE
exit 1 
