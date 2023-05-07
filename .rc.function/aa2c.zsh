#!/usr/bin/env zsh

aa2c () {
	set -x
	aria2c -s16 -x16 --file-allocation=none --remote-time --disable-ipv6 --continue $*
}
