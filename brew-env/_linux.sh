#!/bin/bash
set -Eeou pipefail

[[ -x "$(which apt)" ]] && sudo apt install -y --auto-remove build-essential procps curl file git zsh

brew install \
	homebrew/linux-fonts/font-hack-nerd-font \
	homebrew/linux-fonts/font-jf-open-huninn \
	homebrew/linux-fonts/font-meslo-for-powerline \
	homebrew/linux-fonts/font-meslo-lg-nerd-font \
	rclone \
	util-linux \
	opus \
	zlib \
	webp \
	x264 x265 \
	xinput \
	xvid \
	patchelf \
	pkg-config \
	readline \
	openssl \
	openjpeg \
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
	flac \
	fontforge \
	bzip2 \
#	irssi \
#	vault \
#	openjdk \
#	influxdb \
#	heroku \
#	adoptopenjdk \

IS_STEAMOS=0
LSB_RELEASE=$(which lsb_release)
if [[ -n "${LSB_RELEASE}" ]]; then
  if [[ "$(${LSB_RELEASE} -i | grep SteamOS | awk -F: '{print $NF}' | xargs)" == "SteamOS" ]]; then
    IS_STEAMOS=1
  fi
fi
if [[ "${IS_STEAMOS}" == "1" ]] then
  TARGET_FONT_ROOT=$(sudo bash -c 'echo "$HOME"')/.local/share/
  if [[ ! -L "${TARGET_FONT_ROOT}/fonts" ]]; then
    sudo rm -f "${TARGET_FONT_ROOT}/fonts/.uuid"
    sudo rm -f "${TARGET_FONT_ROOT}/fonts/*"
    sudo rmdir "${TARGET_FONT_ROOT}/fonts"
  fi
  sudo ln -sf /home/linuxbrew/.linuxbrew/share/fonts "${TARGET_FONT_ROOT}"
  sudo fc-cache -fv
else
  if [[ ! -L "/usr/local/share/fonts" ]]; then
    sudo rm -f /usr/local/share/fonts/.uuid
    sudo rm -f /usr/local/share/fonts/*
    sudo rmdir /usr/local/share/fonts
  fi
  sudo ln -sf /home/linuxbrew/.linuxbrew/share/fonts /usr/local/share/
  sudo fc-cache -fv

  # install 1Password GUI
  if [[ ! -f "/etc/apt/sources.list.d/1password.list" ]]; then
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
  fi
fi
