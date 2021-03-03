#!/bin/bash

echo "### Setting Anyenv..."
anyenv init
anyenv install --init
anyenv install pyenv
anyenv install ndenv
anyenv install goenv
anyenv install nodenv

echo "### Setting Pyenv..."

eval "$(pyenv init -)"

python2=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1)
python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1)
pyenv install $python2
pyenv install $python3
pyenv global $python2 $python3
pyenv rehash

pyenv virtualenv $python2 neovim2
pyenv virtualenv $python3 neovim3

pyenv activate neovim2
pip install --upgrade pip
pip install neovim
pyenv deactivate

pyenv activate neovim3
pip install --upgrade pip
pip install neovim
pyenv deactivate

