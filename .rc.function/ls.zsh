#!/usr/bin/env zsh

[[ -x "$(which eza)" ]] && fpath=("$(brew --prefix eza)/share/zsh/site-functions" $fpath) && compinit

#_ls () {
#	if [[ -x "$(which eza)" ]]; then
#		eza --icons --bytes --group --git --extended "$@"
#	else
#		/bin/ls -hG --color=always "$@"
#	fi
#}
#
#alias ls='_ls'

if [[ -x "$(which eza)" ]]; then
	alias ls='eza --icons --bytes --group --git --extended'
	alias l='ls -lab'
fi
