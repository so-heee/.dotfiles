## Setting nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

## Setting neovim
export XDG_CONFIG_HOME="$HOME/.dotfiles"

## Setting pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1