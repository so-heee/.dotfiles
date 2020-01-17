" vim-airline
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" neoterm
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
