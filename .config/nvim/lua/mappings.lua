local g = vim.g
local map = require("utils").map
local opts = {silent = true}

g.mapleader = ' '

------------------------------
-- normal mode
------------------------------
-- 行頭と行末の入れ替え
map('n', '<C-h>', '^')
map('n', '<C-l>', '$')
-- セミコロンとコロンの入れ替え
map('n', ';', ':')
map('n', ':', ';')
-- バッファ
map('n', '<TAB>', ':bp<CR>')
map('n', '<S-TAB>', ':bn<CR>')
-- 折り返し
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', 'gj', 'j')
map('n', 'gk', 'k')
-- ハイライトを削除する
map('n', '<Esc><Esc>', ':nohlsearch<CR>')
-- ファイル保存と終了
map('n', '<leader>w', ':w<CR>')
-- 全選択
map('n', '<C-a>', 'gg<S-v>G')
-- ファイル保存と終了
map('n', '<leader>jq', ':%!jq "."<CR>')

------------------------------
-- insert mode
------------------------------
-- Esc
map('i', 'jj', '<Esc>', opts)
-- カーソル
map('i', '<C-a>', '<Home>')
map('i', '<C-e>', '<End>')
map('i', '<C-h>', '<BS>')
map('i', '<C-d>', '<Del>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')

------------------------------
-- commandline mode
------------------------------
-- カーソル
map('c', '<C-a>', '<Hoem>')
map('c', '<C-e>', '<End>')
map('c', '<C-f>', '<Right>')
map('c', '<C-b>', '<Left>')
map('c', '<C-p>', '<Up>')
map('c', '<C-n>', '<Down>')

------------------------------
-- visual mode
------------------------------
-- 折り返し
map('v', 'j', 'gj')
map('v', 'k', 'gk')
map('v', 'gj', 'j')
map('v', 'gk', 'k')
-- インデント
map('v','<','<gv')
map('v','>','>gv')
-- ペースト時に上書きしない
map('v','p','"_dP')

------------------------------
-- terminal mode
------------------------------
map('t', 'jj', '<C-\\><C-n>')

------------------------------
-- operator-pending  mode
------------------------------
map('o', 'jj', '<Esc>')
