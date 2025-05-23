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
	openssl \
	mas \
	imagemagick \
	irssi \
	bgpdump \
	jpeg \
	kubernetes-cli \
	libtool \
	webp \
	brettferdosi/tap/rclone-cask \
	x264 x265 \
	xvid \
	libusb libusb-compat \
	openjpeg \
	screenresolution \
	opus \
	lzo \
	vault \
	ext4fuse \
	flac \
	gnupg \
	gnupg2 \
	pinentry-mac \
	iproute2mac \
	podman podman-desktop \
	helm \
	html-xml-utils \
	telnet \
	battery \
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
	font-hack-nerd-font \
	font-jf-open-huninn \
	font-meslo-for-powerline \
	font-meslo-lg-nerd-font \
	aerial \
	1password 1password-cli \
	google-chrome google-chrome@beta \
	firefox \
	visual-studio-code \
	microsoft-word microsoft-powerpoint microsoft-excel microsoft-outlook \
	alfred \
	jordanbaird-ice \
	iterm2 \
	istat-menus \
	wireshark \
	gpg-suite-no-mail \
	mattermost \
	discord \
	iina \
	google-drive \
	parallels \
	adobe-creative-cloud \
	telegram telegram-desktop \
	gcenx/wine/kegworks \
	nrlquaker-winbox \
	android-platform-tools \
	canon-eos-utility \
	WebPQuickLook \
	qlstephen qlmarkdown quicklook-json betterzip qlimagesize suspicious-package apparency qlvideo \
	sony-ps-remote-play \
	microsoft-remote-desktop \
	keka \
	uninstallpkg \
	choosy \
	haraguroicha/brew/caffeine-app \
	tg-pro \
	virtualbuddy@beta \
	lihaoyun6/tap/airbattery \
	rsyncui \
#	coconutbattery \
#	macpass \
#	shimo \
#	onyx \
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

brew install --cask --force --no-quarantine \
	via qmk-toolbox

brew install ruby@3.0
# install ipa tool
$(brew --prefix ruby@3.0)/bin/gem install shenzhen
