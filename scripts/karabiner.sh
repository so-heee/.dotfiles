#!/bin/bash

echo "### Setting Karabiner..."
mkdir -p ${HOME}/.config/karabiner
ln -sfnv ${HOME}/.dotfiles/karabiner/karabiner.json ${HOME}/.config/karabiner/karabiner.json
