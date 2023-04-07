#!/usr/bin/env zsh

mm () {
	SN=`hostname`-mtr-google
	P_TITLE="mtr to dns.google"
	tmux new -d "sleep 1"
	tmux has -t $SN 2> /dev/null
	if [[ $? != 0 ]]; then
		tmux new -s $SN -n $P_TITLE -d "echo 'starting to mtr dns v4'; sleep .25; while true; do sudo mtr -4 dns.google; sleep 1; done" \; \
			splitw -h -p 50 "echo 'starting to mtr ipv4'; sleep .75; while true; do sudo mtr 8.8.8.8; sleep 1; done" \; \
			lastp \; \
			splitw -v -p 50 "echo 'starting to mtr dns v6'; sleep .5; while true; do sudo mtr -6 dns.google; sleep 1; done" \; \
			lastp \; \
			setw synchronize-panes\; \
			send-keys n\; \
			attach
	else
		tmux a -t $SN
	fi
}
