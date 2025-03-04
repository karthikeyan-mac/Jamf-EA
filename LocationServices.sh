#!/bin/zsh

# Jamf Extension Attribute to report Location Services status of a Mac
# Karthikeyan 
# 
#
location_status=$(defaults read /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled 2>/dev/null)

# Output the result based on the status value
echo "<result>$( [[ "$location_status" == "1" ]] && echo "Enabled" || echo "Disabled" )</result>"
