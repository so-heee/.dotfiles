"----------------------------------------
" kassio/neoterm
"----------------------------------------
UsePlugin 'neoterm'

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
:tnoremap <Esc> <C-\><C-n>

nnoremap <c-t><c-t> :Tnew<CR><C-w><C-w>
