#!/bin/bash

#brew cask
#brew tap caskroom/versions
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap heroku/brew
brew tap gcenx/wine

[ -n "$(uname -mp | grep arm)" ] && export AppleM=1 || AppleM=0

[ "${AppleM}" == "1" ] && echo "You running on ARM-based macOS, install Rosetta instead" && sudo softwareupdate --install-rosetta --agree-to-license

brew install --cask macfuse

brew install \
	zsh \
	most \
	coreutils grep \
	ncdu \
	mobile-shell \
	mtr \
	nmap \
	pyenv \
	go \
	govc \
	tmux \
	git \
	tree \
	autoconf \
	automake \
	node \
	openssl \
	ffmpeg \
	mas \
	jq \
	yq \
	ansifilter \
	htop \
	libyubikey pam_yubico pam-u2f \
	speedtest-cli \
	ipcalc \
	subnetcalc \
	httping \
	aria2 \
	hugo \
	nano \
	imagemagick \
	bash \
	bash-git-prompt \
	iperf3 \
	ncurses \
	dialog \
	neofetch \
	thefuck \
	irssi \
	bgpdump \
	pv \
	jpeg \
	gnu-tar \
	azure-cli \
	kubernetes-cli \
	libtool \
	watch \
	webp \
	rclone \
	nvm \
	x264 x265 \
	xvid \
	xz \
	yarn \
	readline \
	libusb libusb-compat \
	openjpeg \
	screenresolution \
	opus \
	lzo \
	vault \
	heroku heroku-node \
	exiftool \
	ext4fuse \
	flac \
	gnupg \
	gnupg2 \
	pinentry-mac \
	cocoapods \
	iproute2mac \
	homebrew/cask/docker \
	docker-compose \
	helm \
	hudochenkov/sshpass/sshpass \
	InstantClientTap/instantclient/instantclient-basic InstantClientTap/instantclient/instantclient-sqlplus InstantClientTap/instantclient/instantclient-tools \
	html-xml-utils \
	expect moreutils \
	fzf sheldon \
	fswatch \
	diff-so-fancy \
	direnv \
	podman \
	upx \
	scc \
	mongodb/brew/mongodb-community@5.0 \
	telnet \

brew install --cask \
	1password \
	google-chrome google-chrome-beta \
	firefox \
	visual-studio-code \
	microsoft-word microsoft-powerpoint microsoft-excel microsoft-outlook \
	alfred \
	dropbox \
	bartender \
	iterm2 \
	macdown \
	coconutbattery \
	shimo \
	istat-menus \
	onyx \
	wireshark \
	WebPQuickLook \
	gpg-suite-no-mail \
	font-hack-nerd-font \
	mattermost \
	discord \
	macpass \
	iina \
	google-drive \
	parallels \
	adobe-creative-cloud \
	telegram telegram-desktop \
	unofficial-wineskin \
	nrlquaker-winbox \
	android-platform-tools \
	canon-eos-utility \
	canon-eos-webcam-utility \
	font-jf-open-huninn \
	lens \
#	microsoft-azure-storage-explorer \
#	sony-ps4-remote-play \

# which not support with Apple Silicon
if [ "${AppleM}" == "0" ]; then
	brew install --cask \
		intel-power-gadget \
		oxwu \

fi
