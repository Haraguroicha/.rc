#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )
cd "$HOME"

ln -sf "$DIR/.tmux.conf"
ln -sf "$DIR/.bashrc-env"
