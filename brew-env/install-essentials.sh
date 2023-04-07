#!/bin/bash

OSTYPE=$(uname)

#cd "$(realpath $(dirname "$0"))"
PWD=$( cd "$( dirname "$0" )" && pwd )

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
[ ! -x "$(which brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "brew installed, ignore to execute installer"

[ ! -x "$(which brew)" ] && [ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

brew analytics off

# install for both of Darwin and Linux used packages
brew install xz ansifilter most fzf sheldon fswatch \
	diff-so-fancy direnv upx podman mtr ncdu git jq yq go \
	tmux htop ipcalc subnetcalc httping nano bash iperf3 \
	coreutils grep ncurses dialog neofetch thefuck pv \
	gcc hudochenkov/sshpass/sshpass \
	gping

case $OSTYPE in
	Darwin)
	"$PWD/_darwin.sh"
	;;
	Linux)
	"$PWD/_linux.sh"
	;;
	*)
	echo "Not impletement"
	;;
esac
