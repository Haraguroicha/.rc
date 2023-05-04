#!/bin/bash

[ ! -x "$(which brew)" ] && [ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

#brew cask
#brew tap caskroom/versions
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap heroku/brew
brew tap gcenx/wine

[ -n "$(uname -mp | grep arm)" ] && export AppleM=1 || AppleM=0

if [[ "${AppleM}" == "1" ]]; then
	if [[ -z "$(arch -arch x86_64 sysctl -in sysctl.proc_translated 2>/dev/null)" ]]; then
		echo "You running on ARM-based macOS, install Rosetta instead"
		sudo softwareupdate --install-rosetta --agree-to-license
	else
		echo "You have installed Rosetta, ignore for installer"
	fi
fi


brew install --cask macfuse

brew install \
	zsh \
	telnet \
	mobile-shell \
	nmap \
	pyenv \
	govc \
	hugo \
	tree \
	autoconf \
	automake \
	node \
	openssl \
	ffmpeg \
	mas \
	libyubikey pam_yubico pam-u2f \
	teamookla/speedtest/speedtest \
	aria2 \
	imagemagick \
	bash-git-prompt \
	irssi \
	bgpdump \
	jpeg \
	gnu-tar \
	azure-cli Azure/kubelogin/kubelogin \
	kubernetes-cli \
	libtool \
	watch \
	webp \
	rclone \
	nvm \
	x264 x265 \
	xvid \
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
	InstantClientTap/instantclient/instantclient-basic InstantClientTap/instantclient/instantclient-sqlplus InstantClientTap/instantclient/instantclient-tools \
	html-xml-utils \
	expect moreutils \
	scc \
	mongodb/brew/mongodb-community@5.0 \
	duf \
	mupdf \

brew install --cask \
	font-hack-nerd-font font-meslo-for-powerline font-meslo-lg-nerd-font \
	1password 1password-cli \
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
	gpg-suite-no-mail \
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
	WebPQuickLook \
	qlstephen qlmarkdown quicklook-json betterzip qlimagesize suspicious-package apparency qlvideo \
	sony-ps-remote-play \
	microsoft-remote-desktop \
	keka \
	# https://github.com/sindresorhus/quick-look-plugins \
#	microsoft-azure-storage-explorer \

# which not support with Apple Silicon
if [ "${AppleM}" == "0" ]; then
	brew install --cask \
		intel-power-gadget \
		oxwu \

fi
