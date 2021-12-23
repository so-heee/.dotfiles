xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" 参照へ移動
nnoremap <silent> gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
" 型定義へ移動
nnoremap <silent> gt <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
" 実装へ移動
nnoremap <silent> gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
