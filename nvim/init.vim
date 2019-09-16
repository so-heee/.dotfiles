if &compatible
  set nocompatible
endif

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
let s:base_dir = expand('~/.dotfiles/nvim')
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = s:base_dir . '/toml'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_dir . '/dein.toml',     {'lazy':0})
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy':1})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
colorscheme dracula
syntax on
set t_Co=256
set termguicolors
set background=dark
set laststatus=2

runtime! keymap.vim
runtime! options.vim
runtime! plugins.vim
runtime! dein.vim