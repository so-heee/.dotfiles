local g = vim.g
local b = vim.b
local map = require("utils").map
local opts = {silent = true}

g.mapleader = ' '
vim.b.mapleader = ''

------------------------------
-- normal mode
------------------------------
-- 行頭と行末の入れ替え
map('n', 'H', '^')
map('n', 'L', '$')
-- セミコロンとコロンの入れ替え
map('n', ';', ':')
map('n', ':', ';')
-- ペイン
map('n', 'sj', '<C-w>j')
map('n', 'sk', '<C-w>k')
map('n', 'sl', '<C-w>l')
map('n', 'sh', '<C-w>h')
map('n', 'ss', ':<C-u>sp<CR><C-w>j')
map('n', 'sv', ':<C-u>vs<CR><C-w>l')
-- バッファ
map('n', '<Leader>bn', ':new<CR>')
map('n', '<TAB>', ':bp<CR>')
map('n', '<S-TAB>', ':bn<CR>')
map('n', '<Leader>bd', ':bd<CR>')
map('n', '<Leader>bl', ':ls<CR>')
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

------------------------------
-- terminal mode
------------------------------
map('t', 'jj', '<C-\\><C-n>')

------------------------------
-- operator-pending  mode
------------------------------
map('o', 'jj', '<Esc>')
