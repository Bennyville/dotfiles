#!/bin/bash

current_vpn=$(scutil --nc list | awk -F '"' '/Connected/ {print $2}')

if [[ -z $current_vpn ]]; then
	current_vpn="No VPN"
fi

echo "$current_vpn"
