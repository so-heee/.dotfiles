""----------------------------------------
" settings
"----------------------------------------
set noswapfile            " スワップファイルを作らない
set shortmess+=I          " 開始時の挨拶を表示しない
set showmatch             " 対応する括弧をハイライト表示する
set visualbell t_vb=      " ビープ無効

"----------------------------------------
" visual settings
"----------------------------------------
set title                 " タイトルを表示
set number                " 行番号を表示
set cursorline            " 現在の行を強調表示
set virtualedit=onemore   " 行末の1文字先までカーソルを移動できるように
set laststatus=2          " ステータスラインを常に表示
set clipboard+=unnamed
set termguicolors

"----------------------------------------
" tab settings
"----------------------------------------
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

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 拡張子ごとのインデント設定 {{{
set tabstop=2 shiftwidth=2 softtabstop=2

augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType zsh setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType markdown setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
" }}}
