# install Prezto.
if [[ ! -d ~/.zprezto ]];then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  # backup .zshrc
  if [[ ! -d ~/.zshrc ]];then
    cp .zshrc .zshrc.before
  fi
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setting PowerLevel9k. 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(date time)

POWERLEVEL9K_DIR_HOME_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="cyan"
POWERLEVEL9K_DIR_ETC_BACKGROUND="cyan"

POWERLEVEL9K_DATE_BACKGROUND='green'
POWERLEVEL9K_DATE_FORMAT='%D{%y/%d/%m}'
POWERLEVEL9K_TIME_BACKGROUND='green'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u25B8 "

# SettingPeco
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Setting tmux session
function tm() { 
       if [ -n "${1}" ]; then
           tmux attach-session -t ${1} || \
           tmux new-session -s ${1}
    else
           tmux attach-session || \
           tmux new-session
       fi
}
