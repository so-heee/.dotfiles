if &compatible
  set nocompatible
endif

"----------------------------
"python settings
"----------------------------
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

"----------------------------
"dein settings
"----------------------------
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

"----------------------------
"colorscheme settings
"----------------------------
filetype plugin indent on
colorscheme dracula
syntax on

set t_Co=256
set termguicolors
set background=dark
set laststatus=2

"----------------------------------------
" normal mode
"----------------------------------------
" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" ウィンドウサイズ変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+
" ターミナル
nnoremap <c-t><c-t> :Tnew<CR><C-w><C-w>
nnoremap <C-P> :Files<CR>

"----------------------------------------
" insert mode
"----------------------------------------
inoremap <silent> jj <ESC>
" カーソル
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

"----------------------------------------
" commandline mode
"----------------------------------------
" カーソル
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

"----------------------------------------
" terminal mode
"----------------------------------------
tnoremap <silent> jj <C-\><C-n>

"----------------------------------------
" settings
"----------------------------------------
" 文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 入力中のコマンドをステータスに表示する
set showcmd
" 開始時の挨拶を表示しない
set shortmess+=I
" 対応する括弧をハイライト表示する
set showmatch
" 括弧のハイライト表示の秒数を設定
"set matchtime=3
" ビープ無効
set visualbell t_vb=

"----------------------------------------
" visual settings
"----------------------------------------
" シンタックスハイライト
syntax enable
" タイトルを表示
set title
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ステータスラインを常に表示
set laststatus=2

"----------------------------------------
" tab settings
"----------------------------------------
" tabの幅
set tabstop=4
" tabをスペースにする
set expandtab
" スマートインデント
set smartindent
" オートインデント
set autoindent
" キーボードから入力した場合のtabの幅
set softtabstop=4
" 自動で挿入/削除されるインデントの量
set shiftwidth=4

"----------------------------------------
" serch settings
"----------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

set splitbelow

"----------------------------------------
" vim-airline
"----------------------------------------
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

"----------------------------------------
" neoterm
"----------------------------------------
let g:neoterm_default_mod='belowright'
let g:neoterm_size=15
let g:neoterm_autoscroll=1
if has('nvim')
  " Neovim 用
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  " Vim 用
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif

" fzf
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)