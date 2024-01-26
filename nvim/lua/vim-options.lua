vim.cmd("set autoindent")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
vim.o.autoindent = true
vim.o.termguicolors = true
vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Windows
vim.keymap.set("n", "<C-w>K", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-w>J", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-w>L", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-w>H", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.wo.number = true
