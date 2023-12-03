#!/usr/bin/env zsh

OP_SSH_SIGN=/Applications/1Password.app/Contents/MacOS/op-ssh-sign

_ssh-sign-extract () {
	SIGN=$(echo -n "$1" | grep -v 'SSH SIGNATURE' | base64 -d)
	KEY_TYPE=$(echo -n "$SIGN" | gawk 'BEGIN { FS="\0\0\0" } {print $4}' | tr -d '\n\v\0')
	PUBKEY=$(echo -n "$SIGN" | gawk 'BEGIN { FS="\0\0\0" } {print "\x00\x00\x00"$4"\x00\x00\x00"$5}' | od -An -v -tx1 | tr -d ' \n' | sed -E 's/(0a)*(00)*(0a)*$//' | xxd -r -p | base64)
	echo -n "Signed Public Key: ${KEY_TYPE} ${PUBKEY}"
}

if [[ $(echo $#) -ne 0 ]]; then
	"$OP_SSH_SIGN" "$@"
	while [ $(echo $#) -ne 0 ]; do
		f=$1
		shift
		case "$f" in
			*.git_vtag_tmp*)
			_ssh-sign-extract "$(cat $f)"
			;;
		esac
	done
	return 0
fi
