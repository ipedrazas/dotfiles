#!/bin/bash



IP=$(ip addr show dev wlp2s0 | sed -nr 's/.*inet ([^ ]+).*/\1/p')


#echo "EMA LOGIN"

if [[ $IP = 10.10.* ]]
then

      URL="https://emawifigateway.eudra.org/auth/perfigo_cm_validate.jsp"
      PDATA="userip=${IP%/*}&registerGuest=NO&reqForm=perfigo_login.jsp&provider=ECD LDAP&username=pedrazasi&password=Newuser2"

			wget --post-data "$PDATA" $URL >/dev/null 2>&1

fi

#echo $PDATA
#echo $URL






