DOTFILES   := .tmux.conf .vimrc .zshrc
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all: install links

# Install Homebrew Bundle
.PHONY: install
install:
	./homebrew.sh

# Create Symbolic Link
.PHONY: links
links:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)