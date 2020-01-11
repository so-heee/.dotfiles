echo "start setup..."

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew bundle..."
brew bundle

echo "setup dotfiles links"

DOT_FILES=(zshrc vimrc tmux.conf)

for dotfile in ${DOT_FILES[@]}; do 
    ln -s ${CURRENT_DIR}/$file/.$file $HOME/.$file
done

ln -snfv ~/.dotfiles/.zsh/.zshrc ~/.zshrc
ln -snfv ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -snfv ~/.dotfiles/vim/.vimrc ~/.vimrc

echo "finished setup !!"
