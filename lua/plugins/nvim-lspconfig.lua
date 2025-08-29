local lang = require("defines.lang")

local setupconfigs = {}

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
			automatic_enable = {
				exclude = { "luau_lsp" },
			},
		},
	},
	{
		"lopi-py/luau-lsp.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			platform = {
				type = "roblox",
			},
			sourcemap = {
				enabled = true,
				autogenerate = true,
				rojo_project_file = "dev.project.json",
				sourcemap_file = "sourcemap.json",
			},
			types = {
				roblox_security_level = "PluginSecurity",
			},
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
					lspconfig[lsp_name].setup(setupconfigs[lsp_name] and setupconfigs[lsp_name](capabilities) or {
						capabilities = capabilities,
						filetypes = { lang_name },
					})
				end
			end
		end,
	},
}
