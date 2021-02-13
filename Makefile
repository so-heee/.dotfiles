DOTFILES	:= .tmux.conf .vimrc .zshrc
PYTHON2		:= `pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1`
PYTHON3		:= `pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1`

all: install links-dotfiles

## Show dot files in this repo
.PHONY: list
list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

# Install Homebrew Bundle
.PHONY: install
install:
	./homebrew.sh

# Create Dotfiles Symbolic Link
.PHONY: links-dotfiles
links-dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

## Setup Ricty Fonts
.PHONY: setup-fonts
setup-fonts:
	cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
	fc-cache -vf

## Setup Anyenv
.PHONY: setup-anyenv
setup-anyenv:
	anyenv init
	anyenv install --init
	anyenv install pyenv
	anyenv install ndenv
	anyenv install goenv

## Setup Neovim Python2
.PHONY: setup-nvim-python2
setup-nvim-python2:
	pyenv install $(PYTHON2)
	pyenv virtualenv $(PYTHON3) neovim2
	pyenv activate neovim2
	pip install --upgrade pip
	pip install neovim
	pyenv deactivate

## Setup Neovim Python3
.PHONY: setup-nvim-python3
setup-nvim-python3:
	pyenv install $(PYTHON3)
	pyenv virtualenv $(PYTHON3) neovim3
	pyenv activate neovim3
	pip3 install --upgrade pip
	pip3 install neovim
	pyenv deactivate

## Show dot files in this repo
.PHONY: setup-nvim
setup-nvim:
	mkdir -p $(HOME)/.config/nvim 
	touch $(HOME)/.config/nvim/init.vim
	ln -snf $(HOME)/.dotfiles/nvim/init.vim $(HOME)/.config/nvim/init.vim