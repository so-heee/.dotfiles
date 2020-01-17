"----------------------------------------
" Normal Mode
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
" Insert Mode
"----------------------------------------
inoremap <silent> jj <ESC>
" カーソル
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

"----------------------------------------
" Commandline Mode
"----------------------------------------
" カーソル
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

"----------------------------------------
" Terminal Mode
"----------------------------------------
tnoremap <silent> jj <C-\><C-n>
