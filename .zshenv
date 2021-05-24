#----------------------------------------
# autoload
#----------------------------------------
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

#----------------------------------------
# Editor
#----------------------------------------
export EDITOR=nvim
export GIT_EDITOR="${EDITOR}"

#----------------------------------------
# History
#----------------------------------------
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

#----------------------------------------
# Setting Go
#----------------------------------------
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

#----------------------------------------
# Setting Python
#----------------------------------------
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
