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

if exists('g:vscode')
  Plug 'asvetliakov/vim-easymotion'
else
  Plug 'easymotion/vim-easymotion'
endif

Plug 'dracula/vim', {'as': 'dracula'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'simeji/winresizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'markonm/traces.vim'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
" Plug 'neovim/nvim-lspconfig'
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh'
	\ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/vim-goimports'

call plug#end()

" vim-plugでインストールしていないプラグインの個別設定は読み込まない
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction

command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim
