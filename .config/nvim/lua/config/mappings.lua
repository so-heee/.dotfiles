local map = require("config.utils").map
local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------------------
-- normal mode
------------------------------
-- セミコロンとコロンの入れ替え
map("n", ";", ":")
map("n", ":", ";")
-- 折り返し
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")
-- ハイライトを削除する
map("n", "<Esc>", ":nohlsearch<CR>")
-- 全選択
map("n", "<C-a>", "ggVG")
-- ファイル保存と終了
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>x", ":x<CR>")
-- 新しいタブ・ウィンドウ
map("n", "<Leader>\\", ":vsplit<CR>")
map("n", "<Leader>-", ":split<CR>")

------------------------------
-- insert mode
------------------------------
-- Esc
map("i", "jj", "<Esc>", opts)

------------------------------
-- commandline mode
------------------------------

------------------------------
-- visual mode
------------------------------
-- 折り返し
map("v", "j", "gj")
map("v", "k", "gk")
map("v", "gj", "j")
map("v", "gk", "k")
-- インデント
map("v", "<", "<gv")
map("v", ">", ">gv")
-- ペースト時に上書きしない
map("v", "p", '"_dP')

------------------------------
-- terminal mode
------------------------------
map("t", "jj", "<C-\\><C-n>")

------------------------------
-- operator-pending  mode
------------------------------
map("o", "jj", "<Esc>")
