local map = vim.keymap.set

-- Better up/down on wrapped lines.
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search on <esc>.
map("n", "<esc>", "<cmd>nohlsearch<cr>", { silent = true })

-- Save.
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><esc>", { silent = true })

-- Buffers.
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "delete buffer" })
map("n", "H", "<cmd>bprevious<cr>")
map("n", "L", "<cmd>bnext<cr>")

-- Move lines in visual mode.
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- Better indent in visual.
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Window nav.
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
