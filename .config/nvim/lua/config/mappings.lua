-- local map = require("config.utils").map
local map = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

------------------------------
-- normal mode
------------------------------
map("n", ";", ":", { desc = "Change ; to :" })
map("n", ":", ";", { desc = "Change : to ;" })
map("n", "j", "gj", { desc = "Move down (wrap)" })
map("n", "k", "gk", { desc = "Move up (wrap)" })
map("n", "gj", "j", { desc = "Move down" })
map("n", "gk", "k", { desc = "Move up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down + center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up + center" })
map("n", "n", "nzzzv", { desc = "Next search + center" })
map("n", "N", "Nzzzv", { desc = "Previous search + center" })
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<C-a>", "ggVG", { desc = "Select All" })
map("n", "<Leader>w", ":w<CR>", { desc = "Save" })
map("n", "<Leader>q", ":q<CR>", { desc = "Close" })
map("n", "<Leader>x", ":x<CR>", { desc = "Save & Close" })
map("n", "<C-w>\\", ":vsplit<CR>", { desc = "Split Window Vertical" })
map("n", "<C-w>-", ":split<CR>", { desc = "Split Window Horizontal" })
map("n", "Y", "y$", { desc = "End of the line Yank" })
map("n", "x", '"_x', { desc = "Delete without yanking" })

------------------------------
-- insert mode
------------------------------
map("i", "jj", "<Esc>")

------------------------------
-- commandline mode
------------------------------

------------------------------
-- visual mode
------------------------------
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "j", "gj", { desc = "Move down (wrap)" })
map("v", "k", "gk", { desc = "Move up (wrap)" })
map("v", "gj", "j", { desc = "Move down" })
map("v", "gk", "k", { desc = "Move up" })
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("v", "p", '"_dP', { desc = "Paste without yanking" })
map("x", "p", '"_dP', { desc = "Paste without yanking" })

------------------------------
-- terminal mode
------------------------------
map("t", "jj", "<C-\\><C-n>")

------------------------------
-- operator-pending  mode
------------------------------
map("o", "jj", "<Esc>")
