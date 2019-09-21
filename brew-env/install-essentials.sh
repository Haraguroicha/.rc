#!/bin/bash

OSTYPE=`uname`

cd "$(realpath $(dirname "$0"))"

case $OSTYPE in
	Darwin)
	./install_darwin.sh
	;;
	Linux)
	./install_linux.sh
	;;
	*)
	echo "Not impletement"
	;;
esac
