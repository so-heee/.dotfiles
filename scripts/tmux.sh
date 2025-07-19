#!/bin/bash

echo "### Setting Tmux..."
echo "### Install Tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "### Plugin Install Prefix+I"
ln -sfnv ${HOME}/.dotfiles/.config/tmux/.tmux.conf ${HOME}/.tmux.conf
