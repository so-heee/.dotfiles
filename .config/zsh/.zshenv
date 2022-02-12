# パフォーマンス確認用
# zmodload zsh/zprof && zprof

#----------------------------------------
# autoload
#----------------------------------------
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
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

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
