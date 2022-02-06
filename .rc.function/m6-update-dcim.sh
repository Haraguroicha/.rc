#!/bin/bash

export YEAR=`date +%Y`

[[ -n "$1" ]] && export YEAR=$1
[[ -z "$FOLDER" ]] && export FOLDER=EOS_DIGITAL

find /Volumes/${FOLDER}/DCIM -maxdepth 1 -type d \
	| egrep '^.+/\d+_\d+' \
	| sed -E 's#(.+/)([0-9]+_)([0-9]+)$#\1\2\3 \1'$YEAR'\3#g' \
	| xargs -n 2 mv
