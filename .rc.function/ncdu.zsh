#!/usr/bin/env zsh

ncdu () {
  sudo $(brew --prefix)/bin/ncdu \
    --exclude /System/Volumes/Data \
    --exclude /Volumes \
    --exclude "$HOME/Library/CloudStorage" \
    --exclude "$HOME/Library/Mobile Documents" \
    --si \
    "$@"
}
