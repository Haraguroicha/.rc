export MY_RC_PATH=$(dirname $(readlink ~/.zshrc))

[ -n "$XDG_SESSION_ID" ] && _sid=$XDG_SESSION_ID
[ -z "$_sid" ] && [ -n "$TERM_SESSION_ID" ] && _sid=$TERM_SESSION_ID
[ -z "$_sid" ] && _sid=${$(uuidgen):l}
[ -z "$_sid" ] && _sid=$(echo $RANDOM | md5sum | head -c 20)
_neofetch_tmp=${TMPDIR}/_tmp_neofetch_sid_${_sid}.txt
_neofetch () {
	if [ -f "$_neofetch_tmp" ]; then
		cat "$_neofetch_tmp"
	else
		nf="$(cat <<NFS
$(neofetch)
Generated at $(date '+%Y-%m-%d %H:%M:%S'), force update use clean screen by press \e[47m\e[30m ^L \e[0m
 
 
NFS
)"
		echo "$nf" | tee "$_neofetch_tmp"
	fi
}
clear-screen() { echoti clear; rm "$_neofetch_tmp"; _neofetch; zle redisplay; }
zle -N clear-screen
_neofetch

export SHELDON_DIR=$MY_RC_PATH/.sheldon
export SHELDON_CONFIG_DIR=$SHELDON_DIR
export SHELDON_DATA_DIR=$SHELDON_DIR
eval "$(sheldon source)"

#export ZPLUG_HOME=$(brew --prefix zplug)
#[ -f "$ZPLUG_HOME/init.zsh" ] && source $ZPLUG_HOME/init.zsh
#source ${MY_RC_PATH}/.zplugs

#_zplugs_loaded=0
#_zplug_check_and_install () {
#    # Install plugins if there are plugins that have not been installed
#    zcv=$(zplug check --verbose)
#    if [ -n "$zcv" ]; then
#        printf "\n$zcv\nInstall? [y(or any)/N]: "
#        if read -q; then
#            echo
#            zplug install
#        else
#            echo N
#        fi
#        echo
#    else
#        if [ "$_zplugs_loaded" = "0" ]; then
#            _zplugs_loaded=1
#        else
#            echo -e "\n.zplugs changed, reloading ...\n"
#        fi
#    fi
#    # Then, source plugins and add commands to $PATH
#    setopt LOCAL_OPTIONS NO_MONITOR
#    zplug load
#    setopt LOCAL_OPTIONS MONITOR
#    zle && { zle reset-prompt; zle -R }
#}
#_zplug_check_and_install

# enable fzf binding
[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ] && [ -f "${MY_RC_PATH}/.fzf.zsh" ] && source "${MY_RC_PATH}/.fzf.zsh"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# For Plugins default configurations

## zsh-history-substring-search
bindkey '^[^[[A' history-substring-search-up
bindkey '^[^[[B' history-substring-search-down
## zsh-directory-history
bindkey '^j' directory-history-search-backward
bindkey '^k' directory-history-search-forward

alias sudoedit='sudo nano'
alias ncdu='sudo /usr/local/bin/ncdu --si --exclude /System/Volumes/Data --exclude /Volumes'

_ipcalc () {
	[[ "$#" -gt "0" ]] && (
		ip=$1
		shift
		subnetcalc $ip -n $*
	) || echo "Need IP"
}
alias ipcalc='_ipcalc'

alias read-qr='sleep .5; (screencapture -i $TMPDIR/screencapture.qrcode.png && zbarimg -q --raw $TMPDIR/screencapture.qrcode.png; shred -u $TMPDIR/screencapture.qrcode.png) | pbcopy -Prefer txt'

my-rc-update-git () {
	(
		cd "${MY_RC_PATH}"
		git $*
	)
}
my-rc-update () {
	my-rc-update-git pull
}

source $MY_RC_PATH/.import-rc-function.zsh
import-rc-function

# for gpg-agent on macOS, always uses curses to prompt gpg password when in ssh session
if [ -n "$SSH_TTY" ]; then
	export GPG_TTY=$(tty)
	export PINENTRY_USER_DATA="USE_CURSES=1"
fi

#export POWERLEVEL9K_MODE='nerdfont-complete'
#source "`brew --prefix powerlevel9k`/powerlevel9k.zsh-theme"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context dir vcs newline status root_indicator)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(os_icon battery background_jobs history time)
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#eval "neofetch"
eval "$(direnv hook zsh)"
#[ -s "$HOME/.dnx/dnvm/dnvm.sh" ] && source "$HOME/.dnx/dnvm/dnvm.sh" # Load dnvm
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$HOME/.HaraguroichaTools:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export JAVA_HOME=/usr/local/opt/openjdk@11
export PATH="$JAVA_HOME:$PATH"
export TNS_ADMIN="$HOME/.oracle/network/admin"
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
export EDITOR=nano
export MANPAGER='most -s'

# watch .zplugs
#async_start_worker watch_zplugs -n
#_zplugs_callback () {
#	source ${MY_RC_PATH}/.zplugs
#	_zplug_check_and_install
#	_zplugs_new_job
#}
#__killfswatch () {
#	sleep 600
#	_zplugs_loaded=0
#	ps aux | grep 'fswatch -1 .zplugs' | grep -v grep | awk '{print $2}' | xargs kill
#}
#async_register_callback watch_zplugs _zplugs_callback
#_zplugs_new_job () {
#	async_job watch_zplugs fswatch -1 .zplugs
#	async_job watch_zplugs __killfswatch
#}
#_zplugs_new_job
