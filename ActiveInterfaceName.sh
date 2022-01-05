#!/bin/sh
# Karthikeyan Marappan
# Created: 09-01-2018
# Script will display the active network interface
route get apple.com > /dev/null
retValue=`echo $?`
if [ $retValue != 0 ]; then
echo "No Network"
else
activeInterface=`route get apple.com | grep interface | awk '{print $2}'`
hardwareName=`networksetup -listnetworkserviceorder | grep $activeInterface | cut -d ":" -f2 | cut -d "," -f1 | sed -e 's/^[ \t]*//'`
echo "<result>$hardwareName</result>"
fi
