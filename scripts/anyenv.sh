#!/bin/bash

echo "### Setting Anyenv..."
anyenv init
anyenv install --init
anyenv install pyenv
anyenv install ndenv
anyenv install goenv
anyenv install rbenv