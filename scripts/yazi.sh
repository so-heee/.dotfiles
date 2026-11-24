#!/bin/bash

echo "### Setting Yazi..."
ln -sfnv ${HOME}/.dotfiles/.config/yazi ${HOME}/.config/yazi

# package.toml からプラグインを復元
ya pkg install
