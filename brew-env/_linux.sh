#!/bin/bash

sudo apt install -y --auto-remove build-essential procps curl file git zsh

brew tap homebrew/linux-fonts

brew install \
	font-hack-nerd-font \
	util-linux \
	hugo \
	goenv \
	opus \
	zlib \
	webp \
	x264 \
	x265 \
	xinput \
	xvid \
	yarn \
	speedtest-cli \
	patchelf \
	pkg-config \
	pyenv \
	rclone \
	readline \
	openssl \
	openjpeg \
	nvm \
	node \
	lzo \
	libusb \
	libx11 \
	libtool \
	libtiff \
	libpng \
	libmpc \
	libogg \
	libcap \
	libbsd \
	lame \
	json-c \
	jpeg \
	itstool \
	gnutls \
	gettext \
	ffmpeg \
	flac \
	fontforge \
	bzip2 \
	automake autoconf \
#	irssi \
#	vault \
#	openjdk \
#	influxdb \
#	heroku \
	# adoptopenjdk \

sudo ln -s /home/linuxbrew/.linuxbrew/share/fonts /usr/local/share/fonts/
sudo fc-cache -fv

# install 1Password GUI
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
	sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | \
	sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
	sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
	sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install -y 1password 1password-cli policykit-1-gnome
sudo groupadd onepassword-cli
sudo chown root:onepassword-cli "$(which op)" && \
sudo chmod g+s "$(which op)"
