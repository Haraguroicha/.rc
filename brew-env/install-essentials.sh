#!/bin/bash

OSTYPE=$(uname)

#cd "$(realpath $(dirname "$0"))"
PWD=$( cd "$( dirname "$0" )" && pwd )

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
