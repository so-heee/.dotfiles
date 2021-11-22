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
map('n', 'L', 'g_')
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
map('n', '<Leader>nn', ':new<CR>')
map('n', '<Leader>bp', ':bp<CR>')
map('n', '<Leader>bn', ':bn<CR>')
map('n', '<Leader>bd', ':bd<CR>')
map('n', '<Leader>ls', ':ls<CR>')

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

