local fn = vim.fn

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
  use { "dracula/vim", as = "dracula", config = "vim.cmd('colorscheme dracula')" }

	use {
    "nvim-lualine/lualine.nvim", 
	  requires = {'kyazdani42/nvim-web-devicons', opt = true},
		event = "BufWinEnter",
		config = "require('config.lualine')",
	}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "BufWinEnter",
    config = "require('config.treesitter')"
  }


  -- LSP
--  use 'neovim/nvim-lspconfig'
--  use 'williamboman/nvim-lsp-installer'
--  use {'tami5/lspsaga.nvim', config = "require('config.lspsaga')"}

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
		config = "require('config.telescope')",
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('config.bufferline')"
  }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = "require('config.nvim-tree')"
  }

  -- Nvim Plugins
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = "require('config.indentline')"
  }

  use {
    'glepnir/dashboard-nvim',
    event = "BufRead",
    config = "require('config.dashboard')"
  }

  use {
    'numToStr/Comment.nvim',
    config = "require('config.comment')"
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = "require('config.gitsigns')"
  }

  use 'blackCauldron7/surround.nvim'

  -- Vim Plugins
  use 'machakann/vim-highlightedyank'

  use 'segeljakt/vim-silicon'
  
  use {
    'terryma/vim-expand-region',
    config = "require('config.vim-expand-region')"
  }

  use 'unblevable/quick-scope'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
