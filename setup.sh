#!/bin/bash

echo "### Setup anyenv-update..."
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

echo "### Setup anyenv-update..."
python2=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1)
python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
pyenv install $python2
pyenv install $python3
pyenv global $python2 $python3
pyenv rehash