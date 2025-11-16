#----------------------------------------
# Tools
#----------------------------------------

# fzf
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
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --theme=gruvbox --style=header,grid --line-range :100 {}"'

# bat
export BAT_THEME="gruvbox-dark"

# yarn
export PATH=$HOME/.yarn/bin:$PATH

# eza
export LS_COLORS="ur=35;nnn:gr=35;nnn:tr=35;nnn:uw=34;nnn:gw=34;nnn:tw=34;nnn:ux=36;nnn:ue=36;nnn:gx=36;nnn:tx=36;nnn:uu=36;nnn"

# gh
eval "$(gh completion -s zsh)"

# broot
source /Users/s_mochizuki/.config/broot/launcher/bash/br

# mise
eval "$(mise activate zsh)"