#!/bin/bash
# Usage: checkjava.sh [java_version]
#    if no parameter, script assumes 1.6 (for Android JDK)
# Returns: 0 for successful match
#          1 for no Java or wrong Java
if [ $# -eq 0 ] ; then
  assume="1.6"
else
  assume=$1
fi
typeval=`type -p java`
if [[ -n $typeval ]] ; then
  _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
  _java="$JAVA_HOME/bin/java"
else
  echo "Warning: Java not on PATH"
  exit 1
fi
if [[ "$_java" ]]; then
  version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
  jver=${version:0:3}
  if [[ "$jver" != "$assume" ]]; then
    echo "Java version on PATH is $version"
    exit 1
  fi
fi
exit 0