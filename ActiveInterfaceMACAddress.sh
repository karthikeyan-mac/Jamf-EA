#!/bin/sh
# Jamf Extension Attribute by Karthikeyan Marappan
# Retrieves the MAC address of the active network interface

# Get the active network interface used to reach www.apple.com
active_interface=$(/sbin/route get www.apple.com 2>/dev/null | awk '/interface:/ {print $2}')

# Ensure the interface was found before proceeding
if [ -n "$active_interface" ]; then
    # Extract the MAC address of the active network interface
    mac_address=$(ifconfig "$active_interface" | awk '/ether/ {print $2}')
else
    mac_address="Not Found"
fi

# Output in XML format for Jamf Pro
echo "<result>$mac_address</result>"