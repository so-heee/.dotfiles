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
nnoremap <silent> <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

" クイックオープン
nnoremap <silent> <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
" サイドバーの表示切り替え
nnoremap <silent> <leader>fd <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
" パネルの表示切り替え
nnoremap <silent> <leader>ft <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>
" 検索にフォーカス
nnoremap <silent> <leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>

" タブ
nnoremap <silent> <C-h> <Cmd>Tabprevious<CR>
nnoremap <silent> <C-l> <Cmd>Tabnext<CR>

" 履歴
nnoremap u <Cmd>call VSCodeNotify('undo')<CR>
nnoremap <C-r> <Cmd>call VSCodeNotify('redo')<CR>
