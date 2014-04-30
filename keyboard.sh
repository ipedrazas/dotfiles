#! /bin/bash
# sudo apt-get install bluez-compat -y

address="44:2A:60:E2:AC:44"

while (sleep 1)
do
	connected='sudo hidd --show' # > /dev/null
	if [[ ! $connected =~ .*${address}.* ]] ; then
		sudo hidd --connect ${address} # > /dev/null 2>&1
	fi
done

