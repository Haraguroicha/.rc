#!/usr/bin/env zsh

mist-ipsw () {
	ver=$1
	[[ -n "$ver" ]] && shift
	[[ -z "$ver" ]] && ver=$(uname -r | awk -F. '{print $1}')
	sudo mist download firmware $ver --cache-downloads --compatible --firmware-name 'UniversalMac_%VERSION%_%BUILD%_Restore.ipsw' "$@"
}

mist-download () {
	type=$1
	shift
	ver=$1
	[[ -n "$ver" ]] && shift
	[[ -z "$ver" ]] && ver=$(uname -r | awk -F. '{print $1}')
	sudo mist download installer $ver $type --cache-downloads --compatible "$@"
}

mist-app () {
	mist-download application "$@"
}

mist-iso () {
	mist-download iso "$@"
}
