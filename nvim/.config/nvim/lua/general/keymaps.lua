vim.g.mapleader = " "

vim.keymap.set("n", "<cr>", "<cr>")
vim.keymap.set("n", "<c-i>", "<c-i>")
vim.keymap.set("n", "<c-[>", "<c-[>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<s-y>", "y$")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>W", "<cmd>write!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>Q", "<cmd>quitall!<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<leader>C", "<cmd>bdelete!<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>u", "<cmd>nohlsearch<cr>")
