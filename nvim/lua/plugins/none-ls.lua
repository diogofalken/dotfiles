return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
			},
			on_attach = function(client, bufnr) -- Enable formatting on sync
				if client.supports_method("textDocument/formatting") then
					local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = format_on_save,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(_client)
									return _client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({
				bufnr = 0,
				filter = function(_client)
					return _client.name == "null-ls"
				end,
			})
		end, {})
	end,
}
