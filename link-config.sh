#!/usr/bin/env zsh

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$HOME"

source "${DIR}/.import-rc-function.zsh"
import-rc-function

setopt no_nomatch

lnsf .zshrc .zshrc
lnsf .p10k.zsh .p10k.zsh
lnsf .tmux.conf .tmux.conf
lnsf .bashrc-env .bashrc-env
lnsf .homegitconfig .gitconfig
lnsf .homeenvrc .envrc
lnsf .allowed_signers .ssh/allowed_signers

cd "${DIR}"
sudo chown -vR 0:0 ./sudoers.d/*
sudo ln -sf "${DIR}/sudoers.d/mtr" /etc/sudoers.d/mtr
sudo ln -sf "${DIR}/sudoers.d/ncdu" /etc/sudoers.d/ncdu

da
