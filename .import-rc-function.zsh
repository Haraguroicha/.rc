#!/bin/zsh

MY_RC_PATH=$(dirname $(readlink ~/.zshrc))

import-rc-function () {
    for file in $(find "${MY_RC_PATH}/.rc.function" -name \*.zsh); do
        if [[ -a "$file" ]]; then
            source "$file"
        fi
    done
}
