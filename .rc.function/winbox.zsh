#!/usr/bin/env zsh

winbox () {
	export LC_CTYPE=en_US.UTF-8
	export WINEDLLOVERRIDES=mscoree,mshtml=
	export WINEDEBUG=fixme-esync
	export WINEPREFIX="$HOME/Library/Application Support/$(plutil -extract CFBundleIdentifier raw -o - "/Applications/Winbox-mac.app/Contents/Info.plist")"
	cd /Applications/Winbox-mac.app/Contents/Resources
	arch -x86_64 /Applications/Winbox-mac.app/Contents/Resources/wine/bin/wine64 winbox64.exe "${WINBOX_HOST}" "${WINBOX_USER}" "${WINBOX_PASS}"
}

winbox_op () {
	[[ -z "${ROS_OP_ACCOUNT}" ]] && echo "Need 1Password Account" && return
	[[ -z "${ROS_OP_VAULT}" ]] && echo "Need 1Password Vault Name" && return
	[[ -z "${ROS_OP_NAME}" ]] && echo "Need RouterOS Named in 1Password record" && return
	eval "$((cat <<EOF
export WINBOX_HOST={{ op://$ROS_OP_VAULT/$ROS_OP_NAME/url }}
export WINBOX_USER={{ op://$ROS_OP_VAULT/$ROS_OP_NAME/username }}
export WINBOX_PASS={{ op://$ROS_OP_VAULT/$ROS_OP_NAME/password }}
EOF
) | op inject --force --account "${ROS_OP_ACCOUNT}")"
	winbox
}
