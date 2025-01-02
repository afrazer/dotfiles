
vim.g.mapleader = ","


vim.wo.number = true
vim.wo.relativenumber = true

vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")

vim.keymap.set("n", "<leader><space>", "<cmd>noh<cr>")

vim.keymap.set("n", "<c-j>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>bprev<cr>")

vim.keymap.set({ "n", "v" }, "<tab>", "%")

vim.cmd("set gdefault")
vim.cmd("set magic")
vim.cmd("set lazyredraw")
vim.cmd("set showmatch")
vim.cmd("set nowrap")

vim.cmd("set expandtab")
vim.cmd("set smarttab")

vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set scrolloff=5")

