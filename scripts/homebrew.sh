#!/bin/bash

echo "### Start Setup..."
echo -e    "             _\n" \
" ___  ___  | |__   ___  ___  ___\n" \
"/ __|/ _ \ | '_ \ / _ \/ _ \/ _ \\n" \
"\__ \ (_) || | | |  __/  __/  __/\n" \
"|___/\___(_)_| |_|\___|\___|\___|\n" \

echo "### Installing Homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "### Run Brew Doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "### Run Brew Cleanup"
which brew >/dev/null 2>&1 && brew cleanup

echo "### Run Brew Update..."
which brew >/dev/null 2>&1 && brew update

echo "### Run Brew Bundle..."
brew bundle

echo "### Finished Setup !!"
