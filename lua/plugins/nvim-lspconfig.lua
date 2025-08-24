local lang = require("defines.lang")

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
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

			if type(lspconfig) ~= "table" then
				return
			end

			for lang_name, v in pairs(lang) do
				local lsp_name = v.lsp
				if lsp_name and lspconfig[lsp_name] then
					lspconfig[lsp_name].setup({
						capabilities = capabilities,
						filetypes = { lang_name },
					})
				end
			end
		end,
	},
}
