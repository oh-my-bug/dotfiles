local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

map("x", "<leader>p", '"_dP', {})

map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})

map("n", "n", "nzzzv", {})
map("n", "N", "Nzzzv", {})

map("n", "<leader>y", '"+y', {})
map("v", "<leader>y", '"+y', {})
map("n", "<leader>Y", '"+Y', {})
