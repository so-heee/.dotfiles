DOTFILES	:= .gitconfig .tmux.conf .vimrc .zshenv .zshrc

all: install links-dotfiles workspace setup-pyenv setup-navi setup-karabiner setup-nvim

## Show dot files in this repo
.PHONY: list
list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

# Create Dotfiles Symbolic Link
.PHONY: links-dotfiles
links-dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

# Install Homebrew Bundle
.PHONY: install
install:
	@./scripts/homebrew.sh

# Create Workspace
.PHONY: workspace
workspace:
	@./scripts/workspace.sh

## Setup Pyenv
.PHONY: setup-pyenv
setup-pyenv:
	@./scripts/pyenv.sh

## Setup Navi
.PHONY: setup-navi
setup-navi:
	@./scripts/navi.sh

## Setup Karabiner
.PHONY: setup-karabiner
setup-karabiner:
	@./scripts/karabiner.sh

## Setup Neovim
.PHONY: setup-nvim
setup-nvim:
	@./scripts/nvim.sh