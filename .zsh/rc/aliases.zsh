alias ll='ls -laG'

alias ssh-config-update="cat ~/.ssh/conf.d/config ~/.ssh/conf.d/*.conf > ~/.ssh/config"

# cdの後にlsを実行
chpwd() { ll }