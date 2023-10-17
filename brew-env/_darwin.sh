#!/bin/bash

[ ! -x "$(which brew)" ] && [ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

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

brew install --force --overwrite \
	zsh \
	telnet \
	nmap \
	pyenv \
	hugo \
	tree \
	autoconf automake \
	node \
	openssl \
	ffmpeg \
	mas \
	teamookla/speedtest/speedtest \
	aria2 \
	imagemagick \
	bash-git-prompt \
	irssi \
	bgpdump \
	jpeg \
	gnu-tar \
	kubernetes-cli \
	libtool \
	watch \
	webp \
	brettferdosi/tap/rclone-cask \
	nvm \
	x264 x265 \
	xvid \
	readline \
	libusb libusb-compat \
	openjpeg \
	screenresolution \
	opus \
	lzo \
	vault \
	exiftool \
	ext4fuse \
	flac \
	gnupg \
	gnupg2 \
	pinentry-mac \
	iproute2mac \
	docker-compose \
	helm \
	html-xml-utils \
	expect moreutils \
	scc \
	duf \
	gping \
	btop \
	exa \
	bat \
	progress \
	oven-sh/bun/bun \
	hudochenkov/sshpass/sshpass \
	rust \
#	mobile-shell \
#	govc \
#	libyubikey ykpers pam_yubico pam-u2f \
#	mongodb/brew/mongodb-community@5.0 \
#	azure-cli Azure/kubelogin/kubelogin \
#	yarn \
#	cocoapods \
#	homebrew/cask/docker \
#	mupdf \
#	InstantClientTap/instantclient/instantclient-basic InstantClientTap/instantclient/instantclient-sqlplus InstantClientTap/instantclient/instantclient-tools \
#	heroku heroku-node \

brew install --cask --force \
	homebrew/cask-fonts/font-hack-nerd-font \
	homebrew/cask-fonts/font-jf-open-huninn \
	homebrew/cask-fonts/font-meslo-for-powerline \
	homebrew/cask-fonts/font-meslo-lg-nerd-font \
	1password 1password-cli \
	google-chrome homebrew/cask-versions/google-chrome-beta \
	firefox \
	visual-studio-code \
	microsoft-word microsoft-powerpoint microsoft-excel microsoft-outlook \
	alfred \
	bartender \
	iterm2 \
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
	gcenx/wine/wineskin \
	nrlquaker-winbox \
	android-platform-tools \
	canon-eos-utility \
	canon-eos-webcam-utility \
	WebPQuickLook \
	qlstephen qlmarkdown quicklook-json betterzip qlimagesize suspicious-package apparency qlvideo \
	sony-ps-remote-play \
	microsoft-remote-desktop \
	keka \
	uninstallpkg \
	choosy \
	haraguroicha/brew/caffeine-app \
#	dropbox \
#	lens \
#	macdown \
#	https://github.com/sindresorhus/quick-look-plugins \
#	microsoft-azure-storage-explorer \

# which not support with Apple Silicon
if [ "${AppleM}" == "0" ]; then
	brew install --cask \
		intel-power-gadget \
		oxwu \

fi
