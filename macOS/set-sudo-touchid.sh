#!/usr/bin/env zsh

[[ "$(cat /etc/pam.d/sudo | grep auth | grep sufficient | grep pam_tid.so | wc -l | xargs echo)" == "0" ]] && sudo sed -i '' '2i\'$'\n''auth       sufficient     pam_tid.so'$'\n' /etc/pam.d/sudo
