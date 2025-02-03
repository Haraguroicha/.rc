export MY_RC_PATH=$(dirname $(readlink ~/.zshrc))

[ -n "$XDG_SESSION_ID" ] && _sid=$XDG_SESSION_ID
[ -z "$_sid" ] && [ -n "$TERM_SESSION_ID" ] && _sid=$TERM_SESSION_ID
[ -z "$_sid" ] && _sid=${$(uuidgen):l}
[ -z "$_sid" ] && _sid=$(echo $RANDOM | md5sum | head -c 20)
[ -z "${TMPDIR}" ] && export TMPDIR="${XDG_RUNTIME_DIR:-${TMPDIR:-${TMP:-${TEMP:-/tmp}}}}"

export SHELDON_DIR=$MY_RC_PATH/.sheldon
export SHELDON_CONFIG_DIR=$SHELDON_DIR
export SHELDON_DATA_DIR=$SHELDON_DIR
eval "$(sheldon source)"

#_neofetch_tmp=${TMPDIR}/_tmp_neofetch_sid_${_sid}.txt
#_neofetch () {
#	if [ -f "$_neofetch_tmp" ]; then
#		cat "$_neofetch_tmp"
#	else
#		nf="$(cat <<NFS
#$(neofetch)
#Generated at $(date '+%Y-%m-%d %H:%M:%S'), force update use clean screen by press \e[47m\e[30m ^L \e[0m
# 
# 
#NFS
#)"
#		echo "$nf" | tee "$_neofetch_tmp"
#	fi
#}
#clear-screen() { echoti clear; rm "$_neofetch_tmp"; _neofetch; zle redisplay; }
[[ -z "$_fastfetch_tmp" ]] && _fastfetch_tmp=${TMPDIR}/_tmp_fastfetch_sid_${_sid}.txt
_fastfetch() {
	if [ -f "$_fastfetch_tmp" ]; then
		cat "$_fastfetch_tmp"
	else
		ff="$(cat <<NFS
$(fastfetch -c "$(dirname $(readlink ~/.zshrc))/.fastfetch.jsonc" 2>/dev/null)
Generated at $(date '+%Y-%m-%d %H:%M:%S'), force update use clean screen by press \e[47m\e[30m ^L \e[0m
 
 
NFS
)"
		echo "$ff" | tee "$_fastfetch_tmp"
	fi
}
clear-screen() { echoti clear; reset; _fastfetch; zle redisplay; }
zle -N clear-screen
#_neofetch
_fastfetch

# enable fzf binding
[ -f "$(brew --prefix fzf)/shell/key-bindings.zsh" ] && [ -f "${MY_RC_PATH}/.fzf.zsh" ] && source "${MY_RC_PATH}/.fzf.zsh"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# For Plugins default configurations

## zsh-history-substring-search
bindkey '^[^[[A' history-substring-search-up
bindkey '^[^[[B' history-substring-search-down
## zsh-directory-history
bindkey '^j' directory-history-search-backward
bindkey '^k' directory-history-search-forward

alias sudoedit='sudo nano'

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
		cd "$(dirname $(readlink ~/.zshrc))"
		git $*
	)
}
my-rc-update () {
	my-rc-update-git pull
}

source "${MY_RC_PATH}/.import-rc-function.zsh"
import-rc-function
[[ -x "$(which op)" ]] && eval "$(op completion zsh)"; compdef _op op

# for gpg-agent on macOS, always uses curses to prompt gpg password when in ssh session
if [ -n "$SSH_TTY" ]; then
	export GPG_TTY=$SSH_TTY
	export PINENTRY_USER_DATA="USE_CURSES=1"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
export PATH="$HOME/.HaraguroichaTools:$(brew --prefix curl)/bin:$(brew --prefix grep)/libexec/gnubin:$HOME/go/bin:$JAVA_HOME:$PATH"
export TNS_ADMIN="$HOME/.oracle/network/admin"
export DOTNET_ROOT="$(brew --prefix dotnet)/libexec"
export HOMEBREW_NO_INSTALL_CLEANUP=1

if [[ -x "$(which rbenv)" ]]; then
	eval "$(rbenv init - zsh)"
fi

cheat_menu_compdef="$HOME/.HaraguroichaTools/cheat-menu.compdef.zsh"
[[ -f "${cheat_menu_compdef}" ]] && source "${cheat_menu_compdef}"

unset MY_RC_PATH
