return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		local builtin = require("telescope.builtin")

		local nmap = function(mode, keys, func, desc)
			if desc then
				desc = "TSP: " .. desc
			end

			vim.keymap.set(mode, keys, func, { desc = desc })
		end

		-- Diagnostics
		nmap("n", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
		nmap("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
		nmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

		nmap("n", "<leader>sf", builtin.find_files, "[S]earch [F]iles")
		nmap("n", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
		nmap("n", "<leader>fg", builtin.live_grep, "[F]ile [G]rep")
		nmap("n", "<leader>sr", builtin.resume, "[S]earch [R]esume")
		nmap("n", "<leader>sgs", builtin.git_status, "[S]earch [G]it [S]tatus")

		nmap("n", "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, "[/] Fuzzily search in current buffer")
	end,
}
