#!/bin/zsh

DIR=$( cd "$( dirname "$0" )" && pwd )

$DIR/link-config.sh

[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ZSH_PLUGINS_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins
#ZSH_THEMES_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes
#
#(
#    cd "$ZSH_PLUGINS_DIR"
#    for repo in https://github.com/marlonrichert/zsh-autocomplete \
#        https://github.com/zsh-users/zsh-syntax-highlighting \
#        https://github.com/zsh-users/zsh-autosuggestions \
#        https://github.com/zsh-users/zsh-history-substring-search \
#    ; do
#        repo_name=$(echo "$repo" | awk -F/ '{print $NF}')
#        if [ ! -d "$repo_name" ]; then
#            git clone --depth=1 $repo
#        else
#            cd $repo_name
#            git pull
#        fi
#    done
#    cd "$ZSH_THEMES_DIR"
#    for repo in https://github.com/romkatv/powerlevel10k \
#    ; do
#        repo_name=$(echo "$repo" | awk -F/ '{print $NF}')
#        if [ ! -d "$repo_name" ]; then
#            git clone --depth=1 $repo
#        else
#            cd $repo_name
#            git pull
#        fi
#    done
#)

source ~/.zshrc
