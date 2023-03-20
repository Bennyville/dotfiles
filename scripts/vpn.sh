#!/usr/bin/env zsh

vpn="$(scutil --nc list | awk -F'"' '/"([^"]*)/{print $2}' | fzf)"

is_connected=$(networksetup -showpppoestatus "${vpn}" | grep -qv "^connected$")

if ! $is_connected; then
	err "Already connected to '${vpn}'"
	exit 1
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
