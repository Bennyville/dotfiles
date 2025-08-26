#!/usr/bin/env zsh
#
# add VPN credentials to keychain
# security add-generic-password \
#  -D "VPN-Orion" \
#  -s "myVPN" \
#  -a "myUserAccount@myVPN" \
#  -w "mySuperStrongPassword" \
#  -T "/usr/bin/security"

vpn="$(scutil --nc list | awk -F'"' '/"([^"]*)/{print $2}' | fzf)"

networksetup -showpppoestatus "${vpn}" | grep -q "^connected$"
is_connected=$?

if [ $is_connected -eq 0 ]; then
	scutil --nc stop "${vpn}"
	exit 0
fi

password="$(security find-generic-password -s "${vpn}" -w)"

if [[ -z "${password}" ]]; then
	err "Unable to find VPN password in keychain"
	exit 1
fi

scutil --nc start "${vpn}"
sleep 1
osascript -e "tell application \"System Events\" to keystroke tab"
osascript -e "tell application \"System Events\" to keystroke \"${password}\""
osascript -e "tell application \"System Events\" to keystroke return"
sleep 1
osascript -e "tell application \"System Events\" to keystroke return"
