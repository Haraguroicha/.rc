#!/usr/bin/env zsh

DIR=$(dirname $(readlink ~/.zshrc))

if [ ! "$(readlink ~/.nano)" = "${SHELDON_DIR}/repos/github.com/scopatz/nanorc" ]; then
  rm ~/.nano
  ln -sf "${SHELDON_DIR}/repos/github.com/scopatz/nanorc" ~/.nano
fi
if [ ! "$(readlink ~/.nanorc)" = "$HOME/.nano/nanorc" ]; then
  rm ~/.nanorc
  ln -sf ~/.nano/nanorc ~/.nanorc
fi
