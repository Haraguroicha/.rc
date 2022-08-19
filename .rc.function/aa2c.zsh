#!/bin/zsh

aa2c () {
	set -x
	aria2c -s16 -x16 --file-allocation=none $*
}
