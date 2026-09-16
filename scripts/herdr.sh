#!/bin/bash

echo "### Setting Herdr..."
mkdir -p ${HOME}/.config/herdr
ln -sfnv ${HOME}/.dotfiles/.config/herdr/config.toml ${HOME}/.config/herdr/config.toml
