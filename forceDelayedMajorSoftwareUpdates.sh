#!/bin/bash
#Software Update (com.apple.applicationaccess):
#
# Extension Attributes to check if Major Update is delayed and number of days its delayed.
# Karthikeyan Marappan
# 22-Sep-2023
#
#
forceDelayedMajorSoftwareUpdates=`osascript -l JavaScript << EOS           
ObjC.import('Foundation')
ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess').objectForKey('forceDelayedMajorSoftwareUpdates'))                 
EOS`

delay=`osascript -l JavaScript << EOS           
ObjC.import('Foundation')
ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess').objectForKey('enforcedSoftwareUpdateMajorOSDeferredInstallDelay'))
EOS`

if [[ $forceDelayedMajorSoftwareUpdates == "" ]]; then
	echo "<result>Not Configured</result>"
else 
	echo "<result>DelayedMajorUpdates=${forceDelayedMajorSoftwareUpdates},Days=$delay</result>"
fi
