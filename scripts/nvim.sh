#!/bin/bash

echo "### Setting Neovim..."
ln -s ${HOME}/.dotfiles/.config/nvim ${HOME}/.config/nvim

pip install pynvim
