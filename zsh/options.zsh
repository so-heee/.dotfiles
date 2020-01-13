## Setting nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## Setting neovim
export XDG_CONFIG_HOME="$HOME/.dotfiles"

## Setting goenv
export GOPATH=$HOME/Projects/GolangProjects
export PATH=$GOPATH/bin:$PATH

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"