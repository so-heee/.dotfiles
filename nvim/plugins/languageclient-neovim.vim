UsePlugin 'LanguageClient-neovim'

"----------------------------------------
" autozimu/LanguageClient-neovim
"----------------------------------------
set hidden
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls']
    \ }
let g:LanguageClient_loadSettings = 1
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

