#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$HOME"

lnsf .zshrc .zshrc
lnsf .p10k.zsh .p10k.zsh
lnsf .tmux.conf .tmux.conf
lnsf .bashrc-env .bashrc-env
lnsf .homegitconfig .gitconfig
lnsf .homeenvrc .envrc

da
