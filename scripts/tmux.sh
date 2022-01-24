#!/bin/bash

echo "### Setting Tmux..."
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "### Plugin Install Prefix+I"

ln -s ${HOME}/.dotfiles/.config/tmux/.tmux.conf ${HOME}/.tmux.conf
