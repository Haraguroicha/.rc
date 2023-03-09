#!/usr/bin/env zsh

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$HOME"

source $DIR/.import-rc-function.zsh
import-rc-function

lnsf .zshrc .zshrc
lnsf .p10k.zsh .p10k.zsh
lnsf .tmux.conf .tmux.conf
lnsf .bashrc-env .bashrc-env
lnsf .homegitconfig .gitconfig
lnsf .homeenvrc .envrc

da
