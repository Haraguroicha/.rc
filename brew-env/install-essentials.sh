#!/bin/bash

OSTYPE=$(uname)

#cd "$(realpath $(dirname "$0"))"
PWD=$( cd "$( dirname "$0" )" && pwd )

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
[ ! -x "$(which brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "brew installed, ignore to execute installer"

[ ! -x "$(which brew)" ] && [ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

brew analytics off

# install for both of Darwin and Linux used packages
brew install xz ansifilter most fzf sheldon fswatch zsh gping \
	diff-so-fancy direnv upx podman mtr ncdu git jq yq go \
	tmux htop ipcalc subnetcalc httping nano bash iperf3 \
	coreutils grep gawk ncurses dialog neofetch thefuck pv \
	gcc hudochenkov/sshpass/sshpass node hugo pyenv gnu-tar \
	watch oven-sh/bun/bun hudochenkov/sshpass/sshpass bat \
	progress rust teamookla/speedtest/speedtest aria2 nvm \
	readline exiftool docker-compose expect moreutils btop \
	duf scc exa bash-git-prompt

# Compose is now a Docker plugin. For Docker to find this plugin, symlink it:
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

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
