#!/bin/sh
active_interface=$(/sbin/route get www.apple.com | awk '/interface/ { print $2 }')
macAdd=$(ifconfig $active_interface | awk '/ether/{print $2}')
echo $macAdd
