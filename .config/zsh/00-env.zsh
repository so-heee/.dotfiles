#----------------------------------------
# Environment
#----------------------------------------
# インタラクティブシェル用の環境変数

# Less
export LESS='-R -F -X'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

# Man pages with color
export MANPAGER='less -R'

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Language
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8