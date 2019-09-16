"----------------------------------------
" Setting
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
" Visual Setting
"----------------------------------------
" シンタックスハイライト
syntax enable
" color scheme
colorscheme pablo
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
" Tab Settings
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
" Serch Settings
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

"----------------------------------------
" Keymap Settings
"----------------------------------------
"" Normal Mode
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

" Insert Mode
inoremap <silent> jj <ESC>
" カーソル
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" Commandline Mode
" カーソル
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>