return {
	"szw/vim-maximizer",
	config = function()
		vim.keymap.set("n", "<C-w>f", ":MaximizerToggle<CR>", { remap = true })
	end,
}
