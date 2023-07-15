#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

if [ -d "$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim" ]; then
    echo "dein.vim is already installed."
    git -C "$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim" pull

    echo "Updating dein.vim plugins..."
    nvim \
        -c ":call dein#update()" \
        -c ":call clap#installer#download_binary()" \
        -c ":q"
else
    echo "Installing dein.vim..."
    curl -fsSL "https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh" | sh -s -- -uNC "$XDG_DATA_HOME/dein"
    rm -f "$XDG_CONFIG_HOME/dein/init.vim"
    mv "$XDG_CONFIG_HOME/nvim/init.vim.pre-dein-vim" "$XDG_CONFIG_HOME/nvim/init.vim"

    echo "Installing dein.vim plugins..."
    nvim \
        -c ":call clap#installer#download_binary()" \
        -c ":q"
fi

