local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navi to top and end of the line
keymap("", "H", "^", opts)
keymap("", "L", "$", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":<C-u>resize +2<CR>", opts)
keymap("n", "<A-Down>", ":<C-u>resize -2<CR>", opts)
keymap("n", "<A-Left>", ":<C-u>vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":<C-u>vertical resize +2<CR>", opts)

-- No highlighting after search
keymap("n", "<leader>l", ":<C-u>nohlsearch<CR>", opts)

-- Focus center or current cursor position after search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Navigate buffers
keymap("n", "R", ":bnext<CR>", opts)
keymap("n", "E", ":bprevious<CR>", opts)

-- Insert --
-- Press kj fast to Normal mode
keymap("i", "kj", "<ESC>", opts)
-- Move cursor
keymap("i", "<C-h>", "<ESC>ha", opts)
keymap("i", "<C-l>", "<ESC>la", opts)
-- keymap("i", "<C-j>", "<ESC>ja", opts)
-- keymap("i", "<C-k>", "<ESC>ka", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
