"----------------------------------------
" mapleader
"----------------------------------------
let g:mapleader = "\<Space>"

"----------------------------------------
" normal mode
"----------------------------------------
" 行先頭と行末
noremap <C-h> ^
noremap <C-l> $
" セミコロンとコロンを入れ替え
nnoremap ; :
nnoremap : ;
" バッファ
nnoremap <TAB> :bp<CR>
nnoremap <S-TAB> :bn<CR>
" 折り返し
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" ハイライトを削除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" ファイル保存と終了
nnoremap <Leader>w :w<CR>
" 全選択
nnoremap <C-a> gg<S-v>G
" jq
nnoremap <silent> <Leader>jq :%!jq '.'<CR>
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
" visual mode
"----------------------------------------
" 折り返し
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
" インデント
vnoremap < <gv
vnoremap > >gv
" ペースト時に上書きしない
vnoremap p "_dP

"----------------------------------------
" terminal mode
"----------------------------------------
tnoremap <silent> jj <C-\><C-n>

"----------------------------------------
" operator-pending  mode
"----------------------------------------
onoremap <silent> jj <ESC>