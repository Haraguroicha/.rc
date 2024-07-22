#!/usr/bin/env zsh

_ls () {
	if [[ -x "$(which eza)" ]]; then
		eza --icons --bytes --group --git --extended "$@"
	else
		/bin/ls -hG --color=always "$@"
	fi
}

alias ls='_ls'
