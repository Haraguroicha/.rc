#!/bin/bash

#brew cask
#brew tap caskroom/versions
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap heroku/brew
brew tap gcenx/wine

brew install --cask osxfuse

brew install \
	zsh \
	most \
	coreutils \
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
	fzf zplug \
	direnv

[ ! -x '/Applications/Google Chrome.app' ] && brew install --cask google-chrome || echo "Google Chrome installed, ignored"
[ ! -x '/Applications/Firefox.app' ] && brew install --cask firefox || echo "Firefox installed, ignored"
[ ! -x '/Applications/Visual Studio Code.app' ] && brew install --cask visual-studio-code || echo "VS Code installed, ignored"
[ ! -x '/Applications/1Password 7.app' ] && brew install --cask 1password || echo "1Password installed, ignored"
[ ! -x '/Applications/Microsoft Word.app' ] && brew install --cask microsoft-word || echo "Microsoft Word installed, ignored"
[ ! -x '/Applications/Microsoft PowerPoint.app' ] && brew install --cask microsoft-powerpoint || echo "Microsoft Powerpoint installed, ignored"
[ ! -x '/Applications/Microsoft Excel.app' ] && brew install --cask microsoft-excel || echo "Microsoft Excel installed, ignored"
[ ! -x '/Applications/Microsoft Outlook.app' ] && brew install --cask microsoft-outlook || echo "Microsoft Outlook installed, ignored"

brew install --cask \
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
	google-drive-file-stream \
	parallels \
	adobe-creative-cloud \
	telegram telegram-desktop \
	unofficial-wineskin \
	nrlquaker-winbox \
	intel-power-gadget \
	android-platform-tools \
	canon-eos-utility \
	canon-eos-webcam-utility \
	font-jf-open-huninn \
	lens \
	microsoft-azure-storage-explorer \
#	sony-ps4-remote-play \
