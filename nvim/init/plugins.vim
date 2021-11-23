" vim-plugの自動インストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" プラグインの自動インストール
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" g:plugs is a global variable by vim-plug
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
" UsePlugin does not load settings when the plugin is not installed
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim
