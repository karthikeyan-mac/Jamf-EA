#!/bin/sh
# Jamf Extension Attribute to retrieve the active network interface hardware name in a Jamf-friendly format.
# Jamf Extension Attribute by Karthikeyan Marappan
# Created: 09-01-2018
# Verified: 17-03-2025
# 
# Check if there is an active network connection by attempting to resolve apple.com
if ! route get apple.com >/dev/null 2>&1; then
    echo "<result>No Network</result>"
    exit 0
fi

# Get the active network interface used to reach apple.com
active_interface=$(route get apple.com 2>/dev/null | awk '/interface:/{print $2}')

# If an interface is found, get its human-readable hardware name
if [ -n "$active_interface" ]; then
    hardware_name=$(networksetup -listnetworkserviceorder | grep "$active_interface" | cut -d ":" -f2 | cut -d "," -f1 | sed -e 's/^[ \t]*//')
    echo "<result>$hardware_name</result>"
else
    echo "<result>Unknown</result>"
fi