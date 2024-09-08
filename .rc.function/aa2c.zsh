#!/usr/bin/env zsh

_get_urls () {
}

__aa () {
	aria2c -j64 -s16 -x16 --file-allocation=none --remote-time --continue --summary-interval=5 "$@"
}

aa2c () {
	set -x
	args=()
	urls=()
	while [ $# -ne 0 ]; do
		arg=$1
		shift
		case $arg in
			--)
			urls=( "$@" )
			echo -n "$urls[@]"
			break
			;;
			*)
			args+=$arg
			;;
		esac
	done
	if [[ "$#urls[@]" -gt "0" ]]; then
		__aa -i- "${(@)args}" <<<"${(F)urls}"
	else
		__aa "${(@)args}"
	fi
}
