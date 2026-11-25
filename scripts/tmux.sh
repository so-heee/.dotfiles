#!/bin/bash

echo "### Setting Tmux..."
echo "### Install Tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "### Plugin Install Prefix+I"
mkdir -p ${HOME}/.config/tmux
ln -sfnv ${HOME}/.dotfiles/.config/tmux/.tmux.conf ${HOME}/.config/tmux/tmux.conf
# 旧リンク先（~/.tmux.conf）が残っていると二重に読み込まれるため削除する
if [ -L "${HOME}/.tmux.conf" ]; then
  rm -f "${HOME}/.tmux.conf"
fi
