return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
			},
		})

		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})

		vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>")
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
