" vim-plugの自動インストール
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" プラグインの自動インストール
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'machakann/vim-highlightedyank'
Plug 'terryma/vim-expand-region'
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-easy-align'
Plug 'segeljakt/vim-silicon'
Plug 'unblevable/quick-scope'
Plug 'blackCauldron7/surround.nvim'

" vscode-neovimで使用するプラグイン
if exists('g:vscode')
  Plug 'asvetliakov/vim-easymotion'
else
  Plug 'easymotion/vim-easymotion'

  " Plug 'Mofiqul/dracula.nvim'
  Plug 'dracula/vim', {'as': 'dracula'}
  " Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  " Plug 'rose-pine/neovim'
  " Plug 'sainnhe/gruvbox-material'

  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'windwp/nvim-autopairs'

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'onsails/lspkind-nvim'
  Plug 'folke/lsp-colors.nvim'

  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  Plug 'SirVer/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  Plug 'ray-x/go.nvim'

  Plug 'folke/which-key.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'folke/todo-comments.nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " 保留
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  " Plug 'lewis6991/spellsitter.nvim'

endif

call plug#end()

" vim-plugでインストールしていないプラグインの個別設定は読み込まない
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction

command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif