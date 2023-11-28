#!/usr/bin/env zsh

gp () {
	if [[ "$1" == "--" ]]; then
		shift
		gping $*
	else
		[[ ! -x "$(which ipconfig)" ]] && echo "install ipconfig first" && return 1
		[[ ! -x "$(which netstat)" ]] && echo "install netstat first" && return 1
		[[ ! -x "$(which traceroute)" ]] && echo "install traceroute first" && return 1
		[[ ! -x "$(which dig)" ]] && echo "install dig first" && return 1
		gping $(echo -e "$(ipconfig getoption '' router)
$(netstat -nr | grep default | egrep -v '%|#' | awk '{print $2}')
$(ipconfig getoption "" domain_name_server)
$(traceroute -n -w1 -m1 -q1 1.1.1.1 2>&1 | grep -v traceroute | awk '{print $2}')
$(traceroute -n -w1 -m1 -q1 8.8.8.8 2>&1 | grep -v traceroute | awk '{print $2}')
1.1.1.1
$(dig one.one.one.one aaaa +short)
$(dig dns.google +short)
$(dig dns.google aaaa +short)" | uniq | xargs) $*
	fi
}
