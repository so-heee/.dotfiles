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

# pretzoのシンボリックリンク
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load # --verbose

# pretzo設定
if [ ! -e $HOME/.zprezto ]; then
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
fi

if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

for file in .zlogin .zpreztorc .zshenv .zlogout .zprofile
do
	[ ! -e $HOME/$file ] && ln -s $HOME/.zprezto/runcoms/$file $HOME/$file
done

#----------------------------------------
# Setting PowerLevel10k
#----------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

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
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --theme=Dracula --style=header,grid --line-range :100 {}"'

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
export PATH=$PATH:$GOPATH/bin

#----------------------------------------
# Setting navi
#----------------------------------------
export NAVI_TAG_WIDTH=10
export NAVI_FZF_OVERRIDES='--height 100% '

#----------------------------------------
# Setting bat
#----------------------------------------
export BAT_THEME="Dracula"

#----------------------------------------
# Setting yarn
#----------------------------------------
export PATH=$HOME/.yarn/bin:$PATH

function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf