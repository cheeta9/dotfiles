#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

if [ -d "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim" ]; then
    echo "packer.nvim is already installed."
    git -C "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim" pull
else
    echo "Installing packer.nvim..."
    git clone --depth 1 "https://github.com/wbthomason/packer.nvim" \
                        "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim"
fi

