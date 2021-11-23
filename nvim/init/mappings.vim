"----------------------------------------
" mapleader
"----------------------------------------
let g:mapleader = "\<Space>"

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
" バッファ
nnoremap <Leader>nn :new<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>ls :ls<CR>

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


