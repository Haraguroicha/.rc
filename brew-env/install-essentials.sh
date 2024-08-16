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
	diff-so-fancy direnv mtr ncdu git jq yq go hugo tmux \
	btop htop ipcalc subnetcalc httping nano bash iperf3 \
	gcc gcc@11 gcc@12 llvm coreutils grep gawk moreutils \
	watch expect thefuck progress pv readline ncurses bat \
	node pyenv gnu-tar oven-sh/bun/bun podman docker-compose \
	topcheer/sshpass/sshpass teamookla/speedtest/speedtest \
	rustup aria2 nvm bash-git-prompt exiftool duf scc eza \
	dialog fastfetch trippy \

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
