#!/bin/bash

OSTYPE=`uname`

cd "$(realpath $(dirname "$0"))"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew analytics off

case $OSTYPE in
	Darwin)
	./_darwin.sh
	;;
	Linux)
	./_linux.sh
	;;
	*)
	echo "Not impletement"
	;;
esac
