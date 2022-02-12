all: install setup-zsh setup-git setup-fonts setup-workspace setup-karabiner setup-kitty setup-hammerspoon setup-nvim setup-tmux setup-cheat

## Show dot files in this repo
.PHONY: list
list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

# Install Homebrew Bundle
.PHONY: install
install:
	@./scripts/homebrew.sh

# Setup Zsh
.PHONY: setup-zsh
setup-zsh:
	@./scripts/zsh.sh

# Setup Git
.PHONY: setup-git
setup-git:
	@./scripts/git.sh

# Setup LazyGit
.PHONY: setup-lazygit
setup-lazygit:
	@./scripts/lazygit.sh

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

## Setup Asdf
.PHONY: setup-asdf
setup-asdf:
	@./scripts/asdf.sh

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

## Setup Stylua
.PHONY: setup-stylua
setup-stylua:
	@./scripts/stylua.sh

## Setup Cheat
.PHONY: setup-cheat
setup-cheat:
	@./scripts/cheat.sh
