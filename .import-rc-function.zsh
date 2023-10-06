#!/bin/zsh

DIR=$( cd "$( dirname "$0" )" && pwd )
MY_RC_PATH=$(dirname $(readlink ~/.zshrc) 2>/dev/null)

[ -z "${MY_RC_PATH}" ] && MY_RC_PATH=$DIR

import-rc-function () {
    _MY_RC_FUNCS=()
    for file in $(find "${MY_RC_PATH}/.rc.function" -name \*.zsh); do
        if [[ -a "$file" ]]; then
            _MY_RC_FUNCS+=("$(cat "$file")")
        fi
    done
    export MY_RC_FUNCS="${(@)_MY_RC_FUNCS}"
    eval "${MY_RC_FUNCS}"
}
