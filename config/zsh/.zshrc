### zinit ###
typeset -gAH ZINIT
ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
ZINIT[ZCOMPDUMP_PATH]="$XDG_STATE_HOME/zcompdump"
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

### paths ###
typeset -U path
typeset -U fpath

path=(
    "$HOME/.local/bin"(N-/)
    "$CARGO_HOME/bin"(N-/)
    "$DENO_INSTALL/bin"(N-/)
    "$GOPATH/bin"(N-/)
    "$XDG_CONFIG_HOME/scripts/bin"(N-/)
    "$path[@]"
)

fpath=(
    "$XDG_DATA_HOME/zsh/completions"(N-/)
    "$fpath[@]"
)

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|history|jj?|lazygit|la|ll|ls|rm|rmdir|trash)($| )" ]]
}

### option ###
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_HISTORY
setopt GLOBDOTS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt MAGIC_EQUAL_SUBST
setopt NO_FLOW_CONTROL
setopt NO_SHARE_HISTORY
setopt INTERACTIVE_COMMENTS
setopt PRINT_EIGHT_BIT
setopt PUSHD_IGNORE_DUPS

### homebrew ###
eval "$(/opt/homebrew/bin/brew shellenv)"
### anyenv ###
eval "$(anyenv init -)"
### rbenv ###
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
### nodebrew ###
export PATH="$HOME/.nodebrew/current/bin:$PATH"
### mysql ###
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
### openssl ###
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
### direnv ###
eval "$(direnv hook zsh)"

### theme ###
eval "$(starship init zsh)"

### key binds ###

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    @'zdharma-continuum/null'

