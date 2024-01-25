
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = ","

vim.wo.number = true
vim.wo.relativenumber = true

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set("i", "jk", "<esc><cr>")

