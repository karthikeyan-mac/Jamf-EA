#!/bin/bash
if [ -f "/Library/Preferences/edu.apollogrp.SDI.plist" ]; then
echo "<result>`/usr/bin/defaults read /Library/Preferences/edu.apollogrp.SDI InstalledDate`</result>"
else
echo "<result>`defaults read /var/db/receipts/com.apple.pkg.BaseSystemBinaries InstallDate | awk '{ print $1"_"$2 }'`</result>"
fi