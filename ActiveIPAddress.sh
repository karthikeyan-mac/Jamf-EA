#!/bin/bash

# Jamf Extension Attribute displays the active IP address in a Jamf-friendly format. 
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
active_interface=$(/sbin/route get apple.com 2>/dev/null | awk '/interface:/{print $2}')

# If an interface is found, retrieve the IP address
if [ -n "$active_interface" ]; then
    ip_address=$(ipconfig getifaddr "$active_interface")
    echo "<result>$ip_address</result>"
else
    echo "<result>Unknown</result>"
fi