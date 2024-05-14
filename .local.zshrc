HSTSIZE=1000
SAVEHIST=1000
HISTFILESIZE=1000
HISTFILE=~/.zsh_history

export PAGER="most"
setopt prompt_subst
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

cheat_menu_compdef="$HOME/.HaraguroichaTools/cheat-menu.compdef.zsh"
[[ -f "${cheat_menu_compdef}" ]] && source "${cheat_menu_compdef}"

autoload -Uz promptinit
promptinit
setopt histignorealldups sharehistory
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals
setopt correct
setopt no_nomatch # for matches glob, e.g. * and ?
#autoload -U compinit && compinit
autoload -Uz compinit
_zcompdump_modified_days=0
[[ "${_UNAME}" == "Darwin" ]] && _zcompdump_modified_days="$(stat -f '%Sm' -t '%j' ~/.zcompdump))"
[[ "${_UNAME}" == "Linux" ]] && _zcompdump_modified_days="$(date +'%j' -d "@$(stat --format '%Y' ~/.zcompdump)")"
if [ "$(date +'%j')" != "${_zcompdump_modified_days}" ]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%F{red}Completing%f %F{green}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select
setopt menu_complete

# Require root permission command
[[ "${_UNAME}" == "Darwin" ]] && alias htop='sudo htop'

# Open multi files with vim tab
alias vim='vim -p'

# Alias of quick change dir
#alias .='cd'
#alias ..='cd ..'

# Alias of clear
alias c='clear'

# Alias of ls
#alias ls='ls -h --color=always'
#alias ls='ls -hG --color=always'
alias l='ls -alh'

# Alias of ping
alias p=newPing
alias p6=newPing6

# Alias of mtr
alias m=newMtr
alias mtr=m

# Alias of nslookup
alias n='nslookup'

# Alias of colorful grep
alias grep='grep --colour=always'

# lazy ping
function newPing(){
    if [ -z "$1" ]; then
        ping 8.8.8.8
    else
        ping $*
    fi
}
function newPing6(){
    if [ -z "$1" ]; then
        ping6 2001:4860:4860::8888
    else
        ping6 $*
    fi
}

# lazy mtr
function newMtr(){
    _m="sudo trip"
    _m_args=(
        "--dns-resolve-method" "resolv"
        "--dns-lookup-as-info"
        "--tui-address-mode" "both"
        "--icmp-extensions"
        "--tui-icmp-extension-mode" "all"
    )
    _use_icmp=1
    [[ -z "$1" ]] && _m_args+=("8.8.8.8")
    while [ -n "$1" ]; do
        _next="$1"
        case "$_next" in
            --udp|--tcp)
              _use_icmp=0
              ;;
        esac
        _m_args+=("$_next")
        shift
    done
    [[ "$_use_icmp" == "1" ]] && _m_args+=("--dns-resolve-all")
    eval "${_m}" "${_m_args[@]}" "$@"
}

bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey -s '^ ' 'git status --short^M'

# hook関数precmd実行
__call_precmds() {
  type precmd > /dev/null 2>&1 && precmd
  for __pre_func in $precmd_functions; do $__pre_func; done
}

#shift+upで親ディレクトリへ
#shift+downで戻る
__cd_up()   { builtin pushd ..; echo; __call_precmds; zle reset-prompt }
__cd_undo() { builtin popd;     echo; __call_precmds; zle reset-prompt }
zle -N __cd_up;   bindkey '^[[1;2A' __cd_up
zle -N __cd_undo; bindkey '^[[1;2B' __cd_undo

# command line snow effect
function snow(){
    clear;
    while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS)) $(printf "\u2744\n");sleep 0.1;done|awk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH%s \033[0;0H",a[x],x,$4;}}'
}

[ -f /etc/zsh/zshrc ] && source /etc/zsh/zshrc

# Command search path
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
#source /opt/asn

#[[ -d "$HOME/.cargo/bin" ]] && export PATH=$HOME/.cargo/bin:$PATH
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

source "$(dirname $(readlink ~/.zshrc))/.customize.zshrc"
