#!/bin/bash
# Extended Attribute to report the Windows Virtual Machines from Parallels Desktop
# Created by Karthikeyan Marappan on 12/17/2013
## Copyright 2012 __Apollogrp__. All rights reserved.

##########################################################################################

# The below module loops through the Users Documents
echo "<result>"
mdfind -name .pvm > /tmp/vmlist
cat /tmp/vmlist | while read i; do
if [ -f "/$i/VmInfo.pvi" ]; then
vmosversion=$(cat "/$i/VmInfo.pvi" | grep -i realosversion | awk '{print substr($1,16,8)}') 2> /dev/null
if [ "$vmosversion" == "unknown<" ]; then
echo >/dev/null
else 
echo "$vmosversion -"
fi
else
echo >/dev/null
fi
done
#rm -r /tmp/vmlist
echo "</result>"