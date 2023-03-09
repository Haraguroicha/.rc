#!/usr/bin/env zsh

da () {
	if [ -x "$(which direnv)" ]; then
		direnv allow
		 echo "instslled of direnv file allowed"
	else
		echo "direnv currently is not in your environment"
	fi
}
