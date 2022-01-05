#!/bin/bash

# Karthikeyan Marappan
# Created: 09-01-2018
# Script will display the active IP Address
route get apple.com > /dev/null
retValue=`echo $?`
if [ $retValue != 0 ] ; then
echo "No network" ;
else
activeInterface=$(/sbin/route get www.apple.com | awk '/interface/ { print $2 }')
ipAdd=$(ipconfig getifaddr $activeInterface)
echo $ipAdd ;
fi