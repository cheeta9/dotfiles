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
    [[ ! "$line" =~ "^(history|jj?|lazygit|rm|rmdir|trash)($| )" ]]
}

### option ###
setopt APPEND_HISTORY         # 履歴を追加（毎回 .zsh_history を作るのではなく）
setopt AUTO_CD                # ディレクトリと解釈できる文字列を打てば cd する
setopt AUTO_PUSHD             # cd 時に元のディレクトリを自動でスタックに積む
setopt EXTENDED_HISTORY       # zsh の開始・終了時刻を履歴に保存
setopt GLOBDOTS               # ドットの指定なしで「.」から始まるファイルをマッチ
setopt HIST_IGNORE_ALL_DUPS   # 重複するコマンド行は古いものを削除
setopt HIST_IGNORE_SPACE      # スペースで始まるコマンド行はヒストリから削除
setopt HIST_REDUCE_BLANKS     # 余分な空白は詰めて記録
setopt HIST_SAVE_NO_DUPS      # 古いコマンドと同じものは無視
setopt MAGIC_EQUAL_SUBST      # 「=」以降の補完を有効にする
setopt NO_FLOW_CONTROL        # Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_SHARE_HISTORY       # 履歴を共有しない
setopt INTERACTIVE_COMMENTS   # 「#」以降をコメントとして扱う
setopt PRINT_EIGHT_BIT        # 日本語ファイル名を表示可能にする
setopt PUSHD_IGNORE_DUPS      # 重複するディレクトリはスタックに積まない

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
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
### openssl ###
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
### direnv ###
eval "$(direnv hook zsh)"

### theme ###
eval "$(starship init zsh)"

### key binds ###
bindkey '^k' autosuggest-accept
bindkey '^j' autosuggest-execute

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    @'zdharma-continuum/null'

