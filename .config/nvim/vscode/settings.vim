" コメント
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" 保存
nnoremap <silent> <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
" 閉じる
nnoremap <silent> <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" 参照へ移動
nnoremap <silent> gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
" 型定義へ移動
nnoremap <silent> gt <Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>
" 実装へ移動
nnoremap <silent> gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
" シンボルの名前変更
nnoremap <silent> gn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

" クイックオープン
nnoremap <silent> <leader>f <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
" サイドバーの表示切り替え
nnoremap <silent> <leader>d <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
" パネルの表示切り替え
nnoremap <silent> <leader>t <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>

" タブ
nnoremap <silent> <C-h> <Cmd>Tabprevious<CR>
nnoremap <silent> <C-l> <Cmd>Tabnext<CR>

" 履歴
nnoremap u <Cmd>call VSCodeNotify('undo')<CR>
nnoremap <C-r> <Cmd>call VSCodeNotify('redo')<CR>

" quick-scope
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
