#----------------------------------------
# Setting Zinit
#----------------------------------------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
# zinit light marlonrichert/zsh-autocomplete
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light rupa/z
zinit light paulirish/git-open
zinit snippet PZT::modules/editor/init.zsh

#----------------------------------------
# Setting Starship
#----------------------------------------
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

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
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--height 50% --reverse --border"
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --theme=Dracula --style=header,grid --line-range :100 {}"'

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
# Setting gh
#----------------------------------------
eval "$(gh completion -s zsh)"

#----------------------------------------
# broot
#----------------------------------------
source /Users/sohei.mochizuki/.config/broot/launcher/bash/br

#----------------------------------------
# mise
#----------------------------------------
eval "$(mise activate zsh)"

