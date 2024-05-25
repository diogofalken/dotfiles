return {
	"vim-test/vim-test",
	vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "[Test] nearest" }),
	vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "[Test] file" }),
	vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "[Test] suite" }),
	vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "[Test] last" }),
}
