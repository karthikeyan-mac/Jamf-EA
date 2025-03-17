#!/bin/bash
#
# JAMF Extension Attribute for Jamf Pro to get the current user's password age in days.
# Karthikeyan Marappan
# Verified: 17-03-2025
currentUser=$(ls -l /dev/console | cut -d " " -f 4)
passwordAge=$(expr $(expr $(date +%s) - $(dscl . read /Users/${currentUser} | grep -A1 passwordLastSetTime | grep real | awk -F'real>|</real' '{print $2}' | awk -F'.' '{print $1}')) / 86400)
echo "<result>${passwordAge}</result>"
