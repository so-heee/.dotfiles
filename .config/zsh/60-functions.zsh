#----------------------------------------
# Functions
#----------------------------------------

#----------------------------------------
# Setting zoxide with fzf
#----------------------------------------
fzf-z-search() {
    local res=$(zoxide query -l | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N fzf-z-search

#----------------------------------------
# Setting ghq
#----------------------------------------
function fzf-ghq-search() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N fzf-ghq-search

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