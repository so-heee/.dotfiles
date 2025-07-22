-- local map = require('utils').map
local map = vim.keymap.set
local is_vscode = vim.g.vscode
local vscode = is_vscode and require("vscode-neovim") or nil

-- aaa
map("n", "<leader>ff", function()
	vscode.call("workbench.action.quickOpen")
end, { desc = "Find files" })
map("n", "<leader>fg", function()
	vscode.call("workbench.action.findInFiles")
end, { desc = "Find files" })

-- vim.cmd 'highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6'

-- コメント
-- map('x', 'gc', '<Plug>VSCodeCommentary')
-- map('n', 'gc', '<Plug>VSCodeCommentary')
-- map('o', 'gc', '<Plug>VSCodeCommentary')
-- map('n', 'gcc', '<Plug>VSCodeCommentaryLine')

-- -- 保存
-- map('n', '<leader>w', '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>')
-- -- 閉じる
-- map('n', '<leader>q', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>')
--
-- -- 宣言へ移動
-- map('n', '<leader>lf', '<Cmd>call VSCodeNotify("editor.action.revealDeclaration")<CR>')
-- -- 定義へ移動
-- map('n', '<leader>ld', '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
-- -- 実装へ移動
-- map('n', '<leader>li', '<Cmd>call VSCodeNotify("editor.action.goToImplementation")<CR>')
-- -- 型定義へ移動
-- map('n', '<leader>lt', '<Cmd>call VSCodeNotify("editor.action.goToTypeDefinition")<CR>')
-- -- 参照へ移動
-- map('n', '<leader>lr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')
-- -- シンボルの名前変更
-- map('n', '<leader>lR', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>')
-- -- ホバーを表示
-- map('n', '<leader>lK', '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>')
-- -- 宣言をホバー表示
-- map('n', '<leader>lF', '<Cmd>call VSCodeNotify("editor.action.peekDeclaration")<CR>')
-- -- 定義をホバー表示
-- map('n', '<leader>lD', '<Cmd>call VSCodeNotify("editor.action.peekDefinition")<CR>')
-- -- 定義を分割して表示
-- map('n', '<leader>lh', '<Cmd>call VSCodeNotify("editor.action.revealDefinitionAside")<CR>')
--
-- -- クイックオープン
-- map('n', '<leader>ff', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>')
-- grep検索
-- map('n', '<leader>fg', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>')
-- -- エクスプローラー
-- map('n', '<leader>e', '<Cmd>call VSCodeNotify("workbench.files.action.focusFilesExplorer")<CR>')
-- -- パネルの表示切り替え
-- map('n', '<leader>t', '<Cmd>call VSCodeNotify("workbench.action.togglePanel")<CR>')
--
-- -- タブ
-- map('n', '<C-h>', '<Cmd>Tabprevious<CR>')
-- map('n', '<C-l>', '<Cmd>Tabnext<CR>')
--
-- -- 履歴
-- map('n', 'u', '<Cmd>call VSCodeNotify("undo")<CR>')
-- map('n', '<C-r>', '<Cmd>call VSCodeNotify("redo")<CR>')
