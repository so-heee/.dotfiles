if &compatible
  set nocompatible
endif

"----------------------------------------
" mapleader
"----------------------------------------
let g:mapleader = "\<Space>"

"----------------------------------------
" python settings
"----------------------------------------
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

"----------------------------------------
" dein settings
"----------------------------------------
let s:base_dir = expand('~/.dotfiles/nvim')
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = s:base_dir . '/plugins/config'

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

"----------------------------------------
" normal mode
"----------------------------------------
" 行先頭と行末
noremap H ^
noremap L g_
" セミコロンとコロンを入れ替え
nnoremap ; :
nnoremap : ;
" ペイン
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
" TAB
nnoremap <Tab>      gt
nnoremap <S-Tab>    gT
" バッファ
nnoremap <Leader>nn :new<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>ls :ls<CR>
" FZF
nnoremap <C-t> :Files<CR>
nnoremap <C-h> :History<CR>

"----------------------------------------
" insert mode
"----------------------------------------
inoremap <silent> jj <ESC>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

"----------------------------------------
" commandline mode
"----------------------------------------
" カーソル
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"----------------------------------------
" terminal mode
"----------------------------------------
tnoremap <silent> jj <C-\><C-n>

"----------------------------------------
" operator-pending  mode
"----------------------------------------
onoremap <silent> jj <ESC>

"----------------------------------------
" vscode
"----------------------------------------
if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
end
""----------------------------------------
" settings
"----------------------------------------
set fenc=utf-8            " 文字コードをUFT-8に設定
set nobackup              " バックアップファイルを作らない
set noswapfile            " スワップファイルを作らない
set autoread              " 編集中のファイルが変更されたら自動で読み直す
set showcmd               " 入力中のコマンドをステータスに表示する
set shortmess+=I          " 開始時の挨拶を表示しない
set showmatch             " 対応する括弧をハイライト表示する
"set matchtime=3          " 括弧のハイライト表示の秒数を設定
set visualbell t_vb=      " ビープ無効

"----------------------------------------
" visual settings
"----------------------------------------
syntax enable             " シンタックスハイライト
set title                 " タイトルを表示
set number                " 行番号を表示
set cursorline            " 現在の行を強調表示
set virtualedit=onemore   " 行末の1文字先までカーソルを移動できるように
set laststatus=2          " ステータスラインを常に表示
set clipboard+=unnamed

"----------------------------------------
" tab settings
"----------------------------------------
set tabstop=4             " tabの幅
set expandtab             " tabをスペースにする
set smartindent           " スマートインデント
set autoindent            " オートインデント
set softtabstop=4         " キーボードから入力した場合のtabの幅
set shiftwidth=4          " 自動で挿入/削除されるインデントの量

"----------------------------------------
" serch settings
"----------------------------------------
set ignorecase            " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase             " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch             " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan              " 検索時に最後まで行ったら最初に戻る
set hlsearch              " 検索語をハイライト表示
set splitbelow            " 新規ウィンドウは下に開く

filetype plugin indent on " ファイルタイプ識別

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%


"----------------------------------------
" colorscheme settings
"----------------------------------------
colorscheme dracula
set background=dark
syntax on

set t_Co=256
set termguicolors
"set laststatus=2

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText    ctermbg=NONE guibg=NONE guifg=#55596d
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE guifg=#55596d
