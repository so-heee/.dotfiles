#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    zsh --without-etcdir
    wget
    curl
    tree
    awscli
    colordiff
    cask
    peco
    ricty --with-powerline
    composer
    jq
    ssh-copy-id
    diff-so-fancy
)

# font
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    clipy
    appcleaner
    docker-compose
    dropbox
    skitch
    google-chrome
    google-japanese-ime
    alfred
    iterm2
    cyberduck
    atom
    sourcetree
    visual-studio-code
    virtualbox
    vagrant
    vagrant-manager
    sequel-pro
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END



typescript