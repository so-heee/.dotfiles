#!/bin/bash

echo "### Setting eza..."
THEME="${1:-solarized-dark}"
mkdir -p ${HOME}/.config/eza
ln -sfnv ${HOME}/.dotfiles/.config/eza/themes/${THEME}.yml ${HOME}/.config/eza/theme.yml
