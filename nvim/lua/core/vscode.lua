local map = require("utils").map

-- コメント
map('x', 'gc', '<Plug>VSCodeCommentary')
map('n', 'gc', '<Plug>VSCodeCommentary')
map('o', 'gc', '<Plug>VSCodeCommentary')
map('n', 'gcc', '<Plug>VSCodeCommentaryLine')

-- 保存
map('n', '<leader>w', '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>')
-- 閉じる
map('n', '<leader>q', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>')

-- 参照へ移動
map('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')
-- 型定義へ移動
map('n', 'gt', '<Cmd>call VSCodeNotify("editor.action.goToTypeDefinition")<CR>')
-- 実装へ移動
map('n', 'gi', '<Cmd>call VSCodeNotify("editor.action.goToImplementation")<CR>')
-- シンボルの名前変更
map('n', 'gn', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')

-- クイックオープン
map('n', '<leader>f', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
-- サイドバーの表示切り替え
map('n', '<leader>d', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>')
-- パネルの表示切り替え
map('n', '<leader>t', '<Cmd>call VSCodeNotify("workbench.action.togglePanel")<CR>')

-- タブ
map('n', '<C-h>', '<Cmd>Tabprevious<CR>')
map('n', '<C-l>', '<Cmd>Tabnext<CR>')

-- 履歴
map('n', 'u', '<Cmd>call VSCodeNotify("undo")<CR>')
map('n', '<C-r>', '<Cmd>call VSCodeNotify("redo")<CR>')

-- quick-scope
vim.cmd("highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline")
vim.cmd("highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline")
