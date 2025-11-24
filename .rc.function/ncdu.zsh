#!/usr/bin/env zsh

ncdu () {
  sudo $(brew --prefix)/bin/ncdu \
    --exclude /System/Volumes \
    --exclude /System/Volumes/Data \
    --exclude /Volumes \
    --exclude "/System/Volumes/Data/home/Library/CloudStorage" \
    --exclude "/System/Volumes/Data/home/Library/Mobile Documents" \
    --exclude "$HOME/Library/CloudStorage" \
    --exclude "$HOME/Library/Mobile Documents" \
    --si \
    "$@"
}
