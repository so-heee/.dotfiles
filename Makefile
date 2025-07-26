all: brew-install setup-zsh setup-git setup-workspace setup-karabiner setup-kitty setup-hammerspoon setup-nvim setup-tmux setup-cheat setup-starship

## Show dot files in this repo
.PHONY: list
list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

# Install Homebrew Bundle
.PHONY: brew-install
brew-install:
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

# Setup Broot
.PHONY: setup-broot
setup-broot:
	@./scripts/broot.sh

## Setup Neovim
.PHONY: setup-nvim
setup-nvim:
	@./scripts/nvim.sh

# ## Setup Kitty
# .PHONY: setup-kitty
# setup-kitty:
# 	@./scripts/kitty.sh

# ## Setup Alacritty
# .PHONY: setup-alacritty
# setup-alacritty:
# 	@./scripts/alacritty.sh

## Setup WezTerm
.PHONY: setup-wezterm
setup-wezterm:
	@./scripts/wezterm.sh

## Setup Hammerspoon
.PHONY: setup-hammerspoon
setup-hammerspoon:
	@./scripts/hammerspoon.sh

## Setup Tmux
.PHONY: setup-tmux
setup-tmux:
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

## Setup Starship
.PHONY: setup-starship
setup-starship:
	@./scripts/starship.sh

