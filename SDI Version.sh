#!/bin/sh
if [ -f "/Library/Preferences/edu.apollogrp.SDI.plist" ]; then
echo "<result>`/usr/bin/defaults read /Library/Preferences/edu.apollogrp.SDI Version`</result>"
else
echo "<result>Non-SDI</result>"
fi