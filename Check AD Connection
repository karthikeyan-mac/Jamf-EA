#!/bin/bash

# AD Bind Check Extension Attribute

adName=`dsconfigad -show | grep "Computer Account" | awk '{print toupper}' | awk '{print $4}' | sed 's/$$//'`

if [ ! "$adName" ]; then
    echo "<result>Not Bound</result>"
    exit 0
else
    result1="Bound as $adName"
fi

ldapTest=`id TESTACCOUNTNAME | grep UIDOFTESTACCOUNT`
if [ ! "$ldapTest" ]; then
    result2="LDAP Query Failed"
else
    result2="LDAP Query OK"
fi

keychainTest=`security find-generic-password -l "/Active Directory/YOURDOMAINNAME" /Library/Keychains/System.keychain`
if [ ! "$keychainTest" ]; then
        result3="AD Password Missing"
    else
        result3="AD Password OK"
fi

echo "<result>$result1 - $result2 - $result3</result>"
