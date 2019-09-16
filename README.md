# dotfiles
setup_zsh.sh

## edit .zpreztorc(powerlevel9k)
```.zpreztorc
# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'powerlevel9k'
```

## edit .zpreztorc module(syntax-highlighting,history-substring-search,autosuggestions)
```.zpreztorc
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt'
```

## delete prezto
```
rm -rf ~/.zprezto ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
```

## iterm color
theme solarized dark higher contrast



## neovim
### インストール可能なPythonのバージョンを確認
$ pyenv install --list
### インストール済みのPythonバージョンを確認
$ pyenv versions

### python2環境
$ pyenv install 2.7.15
$ pyenv virtualenv 2.7.13 neovim2
$ pyenv activate neovim2
$ pip2 install neovim
$ pyenv which python

### python3環境
$ pyenv install 3.5.3
$ pyenv virtualenv 3.5.3 neovim3
$ pyenv activate neovim3
$ pip install neovim
$ pyenv which python