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

## other
alias vi='nvim'
alias grep='grep --color=auto'