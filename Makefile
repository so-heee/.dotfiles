DOTFILES	:= .gitconfig .tmux.conf .vimrc .zshenv .zshrc .ideavimrc
all: install links-dotfiles setup-fonts setup-workspace setup-karabiner setup-nvim setup-tmux setup-cheat

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

## Setup Ricty Fonts
.PHONY: setup-fonts
setup-fonts:
	@cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
	@fc-cache -vf

# Create Workspace
.PHONY: setup-workspace
setup-workspace:
	@./scripts/workspace.sh

## Setup Karabiner
.PHONY: setup-karabiner
setup-karabiner:
	@./scripts/karabiner.sh

## Setup Neovim
.PHONY: setup-nvim
setup-nvim:
	@./scripts/nvim.sh

## Setup Kitty
.PHONY: setup-kitty
setup-kitty:
	@./scripts/kitty.sh

## Setup Alacritty
.PHONY: setup-alacritty
setup-alacritty:
	@./scripts/alacritty.sh

## Setup Hammerspoon
.PHONY: setup-hammerspoon
setup-hammerspoon:
	@./scripts/hammerspoon.sh

## Setup Tmux
.PHONY: setup-tmux
	@./scripts/tmux.sh

## Setup Jetbrain
.PHONY: setup-jetbrain
setup-jetbrain:
	@./scripts/jetbrain.sh

## Setup Cheat
.PHONY: setup-cheat
setup-cheat:
	@./scripts/cheat.sh
