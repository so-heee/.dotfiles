local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local isVscode = function()
  return vim.g.vscode == nil
end

require('lazy').setup {
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  { 'machakann/vim-highlightedyank' },
  {
    'terryma/vim-expand-region',
    config = function()
      require 'plugins.vim-expand-region'
    end,
  },
  -- 自動ペアリング
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = "require('plugins.autopairs')",
    cond = isVscode(),
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'nvim-lua/popup.nvim',
    cond = isVscode(),
  },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup()
    end,
    cond = isVscode(),
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'SmiteshP/nvim-navic',
    },
    config = function()
      require 'plugins.lualine'
    end,
    cond = isVscode(),
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end,
    cond = isVscode(),
  },
  --NvimTree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'plugins.nvim-tree'
    end,
    cond = isVscode(),
  },
  -- Telescope
  {
    'Usuim/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'plugins.telescope'
    end,
    cond = isVscode(),
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require 'plugins.indentline'
    end,
    cond = isVscode(),
  },
  -- スクロールバー
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require 'plugins.scrollbar'
    end,
    cond = isVscode(),
  },
  -- Git
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup()
    end,
    cond = isVscode(),
  },
  -- キーマップのポップアップ
  {
    'folke/which-key.nvim',
    config = function()
      require 'plugins.whichkey'
    end,
    cond = isVscode(),
  },
  -- ターミナル
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require 'plugins.toggleterm'
    end,
    cond = isVscode(),
  },
  -- TODOコメントのハイライト
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    config = function()
      require('todo-comments').setup()
    end,
    cond = isVscode(),
  },
  -- カラーコードのハイライト
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
    cond = isVscode(),
  },
  -- Markdownプレビュー
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    cond = isVscode(),
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      { 'SmiteshP/nvim-navic' },
      { 'ray-x/lsp_signature.nvim' },
      { 'glepnir/lspsaga.nvim' },
      { 'folke/lsp-colors.nvim' },
      { 'folke/trouble.nvim' },

      -- Formmater
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional
      { 'onsails/lspkind-nvim' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
      require 'plugins.lsp'
    end,
    cond = isVscode(),
  },

  -- -- Snippet collection
  -- { 'rafamadriz/friendly-snippets' },
  -- -- Snippet engine
  -- { 'L3MON4D3/LuaSnip' },
  -- -- Completion engine
  -- {
  --   'hrsh7th/nvim-cmp',
  --   config = function()
  --     require 'plugins.lsp2.nvim-cmp'
  --   end,
  -- },
  -- -- Snippet completion source
  -- { 'saadparwaiz1/cmp_luasnip' },
  -- -- Buffer completion source
  -- { 'hrsh7th/cmp-buffer' },
  -- -- Path completion source
  -- { 'hrsh7th/cmp-path' },
  -- -- Commadline completion source
  -- { 'hrsh7th/cmp-cmdline' },
  -- -- LSP completion source
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- -- LSP Icons
  -- {
  --   'onsails/lspkind-nvim',
  --   config = function()
  --     require 'plugins.lsp2.lspkind'
  --   end,
  -- },
  --
  -- -- Built-in LSP
  -- {
  --   'neovim/nvim-lspconfig',
  --   config = function()
  --     require 'plugins.lsp2.lspconfig'
  --   end,
  -- },
  -- -- Package Manager
  -- {
  --   'williamboman/mason.nvim',
  --   config = function()
  --     require 'plugins.lsp2.mason'
  --   end,
  -- },
  -- -- LSP manager
  -- { 'williamboman/mason-lspconfig.nvim' },
  -- { 'SmiteshP/nvim-navic' },
  -- { 'ray-x/lsp_signature.nvim' },
  -- { 'glepnir/lspsaga.nvim' },
  -- { 'folke/lsp-colors.nvim' },
  -- -- Formatting and linting
  -- { 'jose-elias-alvarez/null-ls.nvim' },
  -- -- null-ls manager
  -- {
  --   'jayp0521/mason-null-ls.nvim',
  --   config = function()
  --     require 'plugins.lsp2.null-ls'
  --   end,
  -- },
}
