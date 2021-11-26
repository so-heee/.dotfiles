# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## exa
alias ls='exa --group-directories-first'
alias ll='exa -hal --git --time-style=iso --group-directories-first'

# cdの後にlsを実行
chpwd() { ll }

# du/df
alias du="du -h"
alias df="df -h"
alias duh="du -h ./ --max-depth=1"

## safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rmf='rm -rf'

# tmux
alias ide='tmux new-session \; source-file ~/.dotfiles/.tmux.session.conf'

## other
alias vi='nvim'
alias grep='grep --color=auto'

alias wo='cd ~/Workspace'
alias dot='cd ~/.dotfiles'
alias doc='cd ~/Workspace/doc'

alias ch='cheat -p personal'




alias -g F='| fzf'
