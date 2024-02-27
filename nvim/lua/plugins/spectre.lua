return {
	"nvim-pack/nvim-spectre",
	build = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
	keys = {
		{
			"<leader><C-F>",
			function()
				require("spectre").open()
			end,
			desc = "[S]pectre [R]eplace files",
		},
	},
}
