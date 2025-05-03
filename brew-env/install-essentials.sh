#!/bin/bash

OSTYPE=$(uname)

#cd "$(realpath $(dirname "$0"))"
PWD=$( cd "$( dirname "$0" )" && pwd )

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
[ ! -x "$(which brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "brew installed, ignore to execute installer"

[ ! -x "$(which brew)" ] && [ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

brew analytics off

brew install lescanauxdiscrets/tap/zvbi
brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg $(brew options homebrew-ffmpeg/ffmpeg/ffmpeg | grep -vE '\s' | grep --color=never -- '--with-' | grep -viE 'lib(flite|flite)' | grep -viE '(openvino|decklink)' | tr '\n' ' ')

# install for both of Darwin and Linux used packages
brew install xz ansifilter most fzf sheldon fswatch zsh bash gping \
	diff-so-fancy direnv mtr ncdu git jq yq go hugo goenv bat \
	tmux btop htop ipcalc subnetcalc httping nano iperf3 llvm \
	gcc gcc@11 gcc@12 coreutils grep gawk moreutils thefuck pv \
	watch expect progress readline ncurses node pyenv gnu-tar \
	oven-sh/bun/bun podman docker-compose rustup aria2 scc eza \
	topcheer/sshpass/sshpass teamookla/speedtest/speedtest bx \
	nvm bash-git-prompt exiftool duf dialog fastfetch trippy \
	pyenv ffmpeg nmap tree autoconf automake \

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
