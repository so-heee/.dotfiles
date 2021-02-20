## exa
alias ls='exa'
alias ll='ls -halgHiS'
alias llt='ls -halgHiST'
alias l='clear && ll'
alias lsl='exa --group-directories-first'

## cd
alias cdp='cd ~/Projects'

## git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gcm='git commit -m'

## safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

## other
alias vi='nvim'
alias grep='grep --color=auto'

# cdの後にlsを実行
chpwd() { ll }