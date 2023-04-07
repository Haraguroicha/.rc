#!/usr/bin/env zsh

gp () {
	if [[ "$1" == "--" ]]; then
		shift
		gping $*
	else
		gping $(netstat -nr | grep default | egrep -v '%|#' | awk '{print $2}' | xargs) \
			$(dig dns.google +short) \
			$(dig dns.google aaaa +short) \
			$*
	fi
}
