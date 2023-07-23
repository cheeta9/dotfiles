#!/bin/bash
INSTALL_DIR="${INSTALL_DIR:-$HOME/repos/github.com/cheeta9/dotfiles}"

if [ -d "$INSTALL_DIR" ]; then
    echo "Updating dotfiles..."
    git -C "$INSTALL_DIR" pull
else
    echo "Installing dotfiles..."
    git clone -b use-lua https://github.com/cheeta9/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.bash"
