#!/bin/bash

echo "### Setting Neovim..."
mkdir -p ${HOME}/.config/nvim 
touch ${HOME}/.config/nvim/init.vim
ln -snf ${HOME}/.dotfiles/nvim/init.vim ${HOME}/.config/nvim/init.vim