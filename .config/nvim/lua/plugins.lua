local fn = vim.fn
local cmd = vim.cmd

-- プラグインの設定
-- Packer.nvimが無ければ自動インストールする
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

-- このファイル編集時に設定再読み込み
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- VSCodeでは読み込まない
local function not_vscode()
  return not vim.g.vscode
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  -- プラグインマネージャー
  use 'wbthomason/packer.nvim'

  -- ヤンク時にハイライト
  use 'machakann/vim-highlightedyank'

  -- スクリーンショット
  use 'segeljakt/vim-silicon'

  -- 選択領域
  use {
    'terryma/vim-expand-region',
    config = "require('config.vim-expand-region')",
  }

  -- use {
  --   'blackCauldron7/surround.nvim',
  --   config = "require('config.surround')",
  -- }

  -- Nvim Only

  -- use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
  -- use {
  --   'projekt0n/github-nvim-theme',
  --   config = "require('config.github-theme')",
  -- }
  -- use {
  --   'folke/tokyonight.nvim',
  --   setup = function()
  --     vim.g.tokyonight_style = 'night'
  --   end,
  --   config = "vim.cmd('colorscheme tokyonight')",
  -- }
  use {
    'dracula/vim',
    as = 'dracula',
    config = "vim.cmd('colorscheme dracula')",
    cond = not_vscode,
  }

  -- Neovimの高速化
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient').enable_profile()
    end,
    cond = not_vscode,
  }

  -- Lua functions
  use { 'nvim-lua/plenary.nvim', cond = not_vscode }

  -- Popup API
  use { 'nvim-lua/popup.nvim', cond = not_vscode }

  -- Notification Enhancer
  use {
    'rcarriga/nvim-notify',
    config = "require('config.notify')",
    cond = not_vscode,
  }

  -- Cursorhold fix
  use {
    'antoinemadec/FixCursorHold.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
    cond = not_vscode,
  }

  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    cond = not_vscode,
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    after = 'nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end,
    cond = not_vscode,
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = "require('config.nvim-tree')",
    cond = not_vscode,
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = "require('config.lualine')",
    cond = not_vscode,
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = "require('config.treesitter')",
    cond = not_vscode,
  }

  -- Built-in LSP
  use {
    'neovim/nvim-lspconfig',
    config = "require('config.lsp')",
  }

  -- LSP manager
  use { 'williamboman/nvim-lsp-installer' }

  use { 'tami5/lspsaga.nvim' }

  use { 'ray-x/lsp_signature.nvim' }

  use { 'folke/lsp-colors.nvim' }

  use {
    'tamago324/nlsp-settings.nvim',
    after = { 'nvim-lspconfig' },
  }

  use { 'b0o/schemastore.nvim' }

  -- LSP symbols
  use {
    'simrat39/symbols-outline.nvim',
    setup = function()
      vim.g.symbols_outline = { auto_close = true }
    end,
    cond = not_vscode,
  }

  -- Formatting and linting
  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lsp-installer',
    config = "require('config.null-ls')",
    cond = not_vscode,
  }

  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end,
    cond = not_vscode,
  }

  -- Completion engine
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    requires = {
      -- LSP completion source
      'hrsh7th/cmp-nvim-lsp',
      -- Snippet completion source
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      -- Buffer completion source
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      -- Path completion source
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      -- Commadline completion source
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      'onsails/lspkind-nvim',
    },
    config = "require('config.cmp')",
  }

  -- Snippet collection
  use {
    'rafamadriz/friendly-snippets',
    after = 'nvim-cmp',
  }

  -- Snippet engine
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = "require('config.luasnip')",
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = "require('config.autopairs')",
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    config = "require('config.telescope')",
    cond = not_vscode,
  }

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup()
    end,
    cond = not_vscode,
  }

  -- Start screen
  use {
    'goolord/alpha-nvim',
    config = "require('config.alpha')",
    cond = not_vscode,
  }

  -- Color highlighting
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
    cond = not_vscode,
  }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    config = "require('config.toggleterm')",
    cond = not_vscode,
  }

  -- Commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- Indentation
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = "require('config.indentline')",
    cond = not_vscode,
  }

  -- Keymaps popup
  use {
    'folke/which-key.nvim',
    config = "require('config.whichkey')",
    cond = not_vscode,
  }

  -- Smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
    cond = not_vscode,
  }

  -- Smooth escaping
  use {
    'max397574/better-escape.nvim',
    event = { 'InsertEnter' },
    config = function()
      require('better_escape').setup()
    end,
  }

  use {
    'ray-x/go.nvim',
    config = "require('config.go')",
    cond = not_vscode,
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cond = not_vscode,
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup()
    end,
    cond = not_vscode,
  }

  use {
    'tversteeg/registers.nvim',
    cond = not_vscode,
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end,
    cond = not_vscode,
  }

  use {
    'petertriho/nvim-scrollbar',
    requires = 'kevinhwang91/nvim-hlslens',
    config = "require('config.scrollbar')",
    cond = not_vscode,
  }

  if Packer_bootstrap then
    require('packer').sync()
  end
end)
