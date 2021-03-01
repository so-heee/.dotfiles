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

for config (~/.dotfiles/zsh/[0-9]*.zsh) source $config