# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## eza
alias ls='eza --group-directories-first'
alias ll='eza -hal --git --time-style=iso --group-directories-first'
alias cat='bat'

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
alias ide='tmux new-session \; source-file ~/.dotfiles/.config/tmux/.tmux.session.conf'

## other
alias vi='nvim'
alias grep='grep --color=auto'

alias wo='cd ~/Workspace'
alias dot='cd ~/.dotfiles'
alias doc='cd ~/Workspace/doc'

alias ch='cheat -p personal'

alias -g F='| fzf'

alias lg='lazygit -ucd ~/.config/lazygit'

alias tmux='tmux -u'
alias tm='tmux -u'

alias cu='cursor'
alias silicon='silicon --from-clipboard -o silicon.png --theme gruvbox-dark'

alias cl='claude'
alias clc='claude --continue'
alias clr='claude --resume'
