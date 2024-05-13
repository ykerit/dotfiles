#!/bin/bash

echo "start setup dotfiles"

CONFIG_DIR="$HOME/.config"

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

if [ -d "$CONFIG_DIR/nvim" ]; then
   mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.bak"
   mv $HOME/.local/share/nvim ~/.local/share/nvim.bak
   mv $HOME/.local/state/nvim ~/.local/state/nvim.bak
   mv $HOME/.cache/nvim ~/.cache/nvim.bak
fi

if [ -d "$CONFIG_DIR/helix" ]; then
   mv "$CONFIG_DIR/helix" "$CONFIG_DIR/helix.bak"
fi

cp -r config/nvim "$CONFIG_DIR/"
cp -r config/helix "$CONFIG_DIR/"

echo "done!"
