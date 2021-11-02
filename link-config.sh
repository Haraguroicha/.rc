#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$HOME"

lnsf () {
    ln -sf "$DIR/$1" "$2"
}

lnsf .zshrc .zshrc
lnsf .p10k.zsh .p10k.zsh
lnsf .tmux.conf .tmux.conf
lnsf .bashrc-env .bashrc-env
lnsf .homegitconfig .gitconfig
lnsf .homeenvrc .envrc
[ -x "$(which direnv)" ] && direnv allow && echo "instslled of direnv file allowed" || echo "direnv currently is not in your environment"
