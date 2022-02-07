local fn = vim.fn

local function not_vscode()
  return not vim.g.vscode
end

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'machakann/vim-highlightedyank'

  use 'segeljakt/vim-silicon'

  use {
    'terryma/vim-expand-region',
    config = "require('config.vim-expand-region')",
  }

  use {
    'blackCauldron7/surround.nvim',
    config = "require('config.surround')",
  }

  -- Nvim Only

  -- use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
  use {
    'dracula/vim',
    as = 'dracula',
    config = "vim.cmd('colorscheme dracula')",
    cond = not_vscode,
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'tami5/lspsaga.nvim',
      'folke/lsp-colors.nvim',
    },
    config = "require('config.lsp')",
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'onsails/lspkind-nvim',
    },
    config = "require('config.cmp')",
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('config.lualine')",
    cond = not_vscode,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = "require('config.treesitter')",
    cond = not_vscode,
  }

  use {
    'windwp/nvim-autopairs',
    config = "require('config.nvim-autopairs')",
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = "require('config.telescope')",
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('config.nvim-tree')",
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = "require('config.indentline')",
  }

  use {
    'glepnir/dashboard-nvim',
    config = "require('config.dashboard')",
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
    'ray-x/go.nvim',
    config = "require('config.go')",
  }

  use {
    'folke/which-key.nvim',
    config = "require('config.whichkey')",
  }

  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  }

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = "require('config.toggleterm')",
  }

  use {
    'tversteeg/registers.nvim',
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('config.null-ls')",
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
