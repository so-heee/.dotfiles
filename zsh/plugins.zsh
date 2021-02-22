#----------------------------------------
# Setting Zplug Pretzo
#----------------------------------------
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# 構文のハイライト
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# 履歴
zplug "zsh-users/zsh-history-substring-search"
# 補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
# powerlevel10k
zplug "romkatv/powerlevel10k", as:theme, depth:1
# ゴミ箱
zplug "b4b4r07/zsh-gomi", if:"which fzf"

# pretzo関連
zplug "sorin-ionescu/prezto"
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/ruby", from:prezto

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose

if [ ! -e $HOME/.zprezto ]; then
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
fi

# Source Prezto.
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

[ ! -e $HOME/.zlogin ] && ln -s $HOME/.zprezto/runcoms/zlogin $HOME/.zlogin
[ ! -e $HOME/.zpreztorc ] && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc
[ ! -e $HOME/.zshenv ] && ln -s $HOME/.zprezto/runcoms/zshenv $HOME/.zshenv
[ ! -e $HOME/.zlogout ] && ln -s $HOME/.zprezto/runcoms/zlogout $HOME/.zlogout
[ ! -e $HOME/.zprofile ] && ln -s $HOME/.zprezto/runcoms/zprofile $HOME/.zprofile

#----------------------------------------
# Setting PowerLevel10k
#----------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

# autoload -Uz promptinit
# promptinit
# prompt powerlevel10k

#----------------------------------------
# Setting fzf
#----------------------------------------
# Setup fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--height 50% --reverse --border"
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --theme=dracula-sublime --style=header,grid --line-range :100 {}"'

#----------------------------------------
# Setting tmux session
#----------------------------------------
function tm() { 
       if [ -n "${1}" ]; then
           tmux attach-session -t ${1} || \
           tmux new-session -s ${1}
    else
           tmux attach-session || \
           tmux new-session
       fi
}

#----------------------------------------
# Setting anyenv
#----------------------------------------
eval "$(anyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#----------------------------------------
# Setting navi
#----------------------------------------
export NAVI_TAG_WIDTH=10
export NAVI_FZF_OVERRIDES='--height 100% '

#----------------------------------------
# Setting yarn
#----------------------------------------
export PATH=$HOME/.yarn/bin:$PATH