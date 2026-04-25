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
vim.keymap.set("n", "K", "i<CR><Esc>", { desc = "Split line at cursor" })

vim.opt.gdefault = true
vim.opt.magic = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 5
vim.opt.swapfile = false

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

local function toggle_quickfix()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end

    if qf_exists then
        vim.cmd("cclose")
    else
        vim.cmd("open")
    end
end

vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Toggle Quickfix list" })
