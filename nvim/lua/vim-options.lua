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
vim.o.breakindent = true -- Enable smart indenting
vim.o.termguicolors = true
vim.o.splitright = true -- split vertical window to the right
vim.o.splitbelow = true -- split horizontal window to the bottom
vim.o.colorcolumn = "120" -- Vertical line

vim.o.scrolloff = 8 -- Always keep 8 lines above/bellow cursor
vim.o.signcolumn = "yes" -- Show the sign column

vim.o.mouse = "a"

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect" -- have a better completion experience

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

-- AutoCommands
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
