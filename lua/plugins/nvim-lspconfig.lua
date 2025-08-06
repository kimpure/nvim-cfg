local lang = require("defines.lang")

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = lang.lsp,
			automatic_installation = true,
		},
	},
    {
		"neovim/nvim-lspconfig",
		init = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.luau_lsp.setup({
				capabilities = capabilities,
			})
		end,
	},
}
