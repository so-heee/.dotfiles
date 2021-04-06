"----------------------------------------
" junegunn/fzf.vim
"----------------------------------------
let g:fzf_layout = { 'down': '40%' }

" カレントディレクトリのファイル一覧
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Grep検索
nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>
function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction
