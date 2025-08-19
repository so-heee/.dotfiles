#!/bin/bash

echo "### Setting Git..."
ln -sfnv ${HOME}/.dotfiles/.config/git/.gitconfig ${HOME}/.gitconfig
ln -sfnv ${HOME}/.dotfiles/.config/git/.gitignore_global ${HOME}/.gitignore_global
