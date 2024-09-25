return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" },
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			-- https://github.com/neovim/nvim-lspconfig/issues/1155#issuecomment-1205680003
			local languageServerPath = "/Users/diogo.costa/.nvm/versions/node/v18.20.3/lib/node_modules"
			local cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				languageServerPath,
				"--ngProbeLocations",
				languageServerPath,
			}
			lspconfig.angularls.setup({
				capabilities = capabilities,
				cmd = cmd,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local telescope = require("telescope.builtin")

					local nmap = function(mode, keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end

						vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc })
					end

					nmap("n", "K", vim.lsp.buf.hover, "Hover documentation")
					nmap("n", "<C-k>", vim.lsp.buf.signature_help)
					nmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame")
					-- Telescope UI to improve code actions layout
					nmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					nmap("n", "gd", telescope.lsp_definitions, "[G]oto [D]efinition")
					nmap("n", "gr", telescope.lsp_references, "[G]oto [R]eferences")
					nmap("n", "gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
					nmap("n", "gT", telescope.lsp_type_definitions, "Type [D]efinition")
					nmap("n", "<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
					nmap("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				end,
			})
		end,
	},
}
