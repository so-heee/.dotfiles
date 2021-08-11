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
zplug "b4b4r07/zsh-gomi", \
    as:command, \
    use:bin/gomi, \
    on:junegunn/fzf-bin
# ディレクトリ移動
zplug "rupa/z", use:"*.sh"
# pretzo関連
# zplug "sorin-ionescu/prezto"
# zplug "modules/environment", from:prezto
# zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
# zplug "modules/history", from:prezto
# zplug "modules/directory", from:prezto
# zplug "modules/spectrum", from:prezto
# zplug "modules/utility", from:prezto
# zplug "modules/completion", from:prezto
# zplug "modules/prompt", from:prezto
# zplug "modules/homebrew", from:prezto
# zplug "modules/ruby", from:prezto

# インストールチェック
# if ! zplug check --verbose; then
#   printf 'Install? [y/N]: '
#   if read -q; then
#     echo; zplug install
#   fi
# fi

# 初期設定
if [ ! -e $HOME/.zprezto ]; then
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    [ ! -e $HOME/.${rcfile:t} ] && ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

zplug load # --verbose

if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

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

#----------------------------------------
# Setting anyenv
#----------------------------------------
eval "$(anyenv init - --no-rehash)"

#----------------------------------------
# Setting ghq
#----------------------------------------
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

#----------------------------------------
# Setting exa
#----------------------------------------
export EXA_COLORS="ur=35;nnn:gr=35;nnn:tr=35;nnn:uw=34;nnn:gw=34;nnn:tw=34;nnn:ux=36;nnn:ue=36;nnn:gx=36;nnn:tx=36;nnn:uu=36;nnn"

#----------------------------------------
# Setting z
#----------------------------------------
fzf-z-search() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}

zle -N fzf-z-search
bindkey '^[' fzf-z-search

#----------------------------------------
# Setting Go
#----------------------------------------
export PATH="$PATH:$GOPATH/bin"

#----------------------------------------
# Setting gh
#----------------------------------------
eval "$(gh completion -s zsh)"
