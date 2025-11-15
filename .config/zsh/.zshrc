#----------------------------------------
# zcompile
#----------------------------------------
if [ $HOME/.zshrc -nt $HOME/.zshrc.zwc ]; then
   echo "zcompile .zshrc..."
   zcompile ~/.zshrc
fi

if [ $HOME/.zshenv -nt $HOME/.zshenv.zwc ]; then
   echo "zcompile .zshenv..."
   zcompile $HOME/.zshenv
fi

# Load configuration files in numerical order (nn-name.zsh format)
for config (~/.dotfiles/.config/zsh/[0-9][0-9]-*.zsh) source $config

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi


