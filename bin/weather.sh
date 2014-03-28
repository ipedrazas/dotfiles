#!/usr/bin/env bash

###############################################################################
#                                                                             #
# AnsiWeather 1.00 (c) by Frederic Cambus 2013                                #
# https://github.com/fcambus/ansiweather                                      #
#                                                                             #
# Created: 2013/08/29                                                         #
# Last Updated: 2013/10/19                                                    #
#                                                                             #
# AnsiWeather is released under the BSD 3-Clause license.                     #
# See LICENSE file for details.                                               #
#                                                                             #
###############################################################################



###[ Configuration options ]###################################################

config_file=~/.ansiweatherrc

function get_config {
    ret=""
    if [ -f $config_file ]
    then
        ret=$(grep $1 $config_file | awk -F\: '{print $2}')
    fi

    if [ "X$ret" = "X" ]
    then
        return 1
    else
        echo $ret
    fi
}



# System of Units : "metric" or "imperial"
units=$(get_config "units" || echo "metric")

# Display symbols : "true" or "false" (requires an Unicode capable display)
symbols=$(get_config "symbols" || echo true)


#### [ Colors and characters ]#################################################

background=$(get_config "background" || echo "\033[44m")
text=$(get_config "text" || echo "\033[36;1m")
data=$(get_config "data" || echo "\033[33;1m")
delimiter=$(get_config "delimiter" || echo "\033[35m=>")
dashes=$(get_config "dashes" || echo "\033[34m-")



###[ Unicode Symbols for icons ]###############################################

sun=$(get_config "sun" || echo "\033[33;1m\xe2\x98\x80")
moon=$(get_config "moon" || echo "\033[36m\xe2\x98\xbd")
clouds=$(get_config "clouds" || echo "\033[37;1m\xe2\x98\x81")
rain=$(get_config "rain" || echo "\xe2\x98\x94")



###[ Fetch Weather data ]######################################################

weather=$(/usr/bin/curl -s "http://api.openweathermap.org/data/2.5/weather?q=London,GB&units=metric")



###[ Process Weather data ]####################################################

city=$(echo $weather | /usr/bin/jq -r '.name')
temperature=$(printf '%.0f' $(echo $weather | /usr/bin/jq '.main.temp'))
humidity=$(echo $weather | /usr/bin/jq '.main.humidity')
pressure=$(echo $weather | /usr/bin/jq '.main.pressure')
sky=$(echo $weather | /usr/bin/jq -r '.weather[0].main')
sunrise=$(echo $weather | /usr/bin/jq '.sys.sunrise')
sunset=$(echo $weather | /usr/bin/jq '.sys.sunset')



###[ Set the period ]##########################################################

now=$(date +%s)

if [ $now -ge $sunset ] || [ $now -le $sunrise ]
then
    period="night"
else
    period="day"
fi



###[ Set the scale ]###########################################################

case $units in
    metric)
        scale="°C"
        ;;
    imperial)
        scale="°F"
        ;;
esac



###[ Set icons ]###############################################################

if [ $symbols = true ]
then
    case $sky in
        Clear)
            if [ $period = "night" ]
            then
                icon="$moon "
            else
                icon="$sun  "
            fi
            ;;
        Clouds)
            icon="$clouds  "
            ;;
        Rain)
            icon="$rain  "
            ;;
    esac
fi



###[ Display current Weather ]#################################################

echo -e "$background$text Current weather in $city $delimiter$data $temperature $scale $icon$dashes$text Humidity $delimiter$data $humidity % $dashes$text Pressure $delimiter$data $pressure hPa \033[0m"
