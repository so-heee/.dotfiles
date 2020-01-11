echo "### Start Setup..."

echo "### Installing Homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "### Run Brew Doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "### Run Brew Update..."
which brew >/dev/null 2>&1 && brew update

echo "### Run Brew Bundle..."
brew bundle

echo "### Setup Dotfiles Links..."
ln -snfv $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -snfv $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -snfv $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc

echo "### Finished Setup !!"
