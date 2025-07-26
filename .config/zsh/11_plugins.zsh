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
# Setting bat
#----------------------------------------
export BAT_THEME="gruvbox-dark"

#----------------------------------------
# Setting yarn
#----------------------------------------
export PATH=$HOME/.yarn/bin:$PATH

#----------------------------------------
# Setting eza
#----------------------------------------
export LS_COLORS="ur=35;nnn:gr=35;nnn:tr=35;nnn:uw=34;nnn:gw=34;nnn:tw=34;nnn:ux=36;nnn:ue=36;nnn:gx=36;nnn:tx=36;nnn:uu=36;nnn"

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
# Setting gh
#----------------------------------------
eval "$(gh completion -s zsh)"

#----------------------------------------
# broot
#----------------------------------------
source /Users/s_mochizuki/.config/broot/launcher/bash/br

#----------------------------------------
# mise
#----------------------------------------
eval "$(mise activate zsh)"
