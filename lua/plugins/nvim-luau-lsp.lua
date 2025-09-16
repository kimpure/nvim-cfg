vim.lsp.config("luau-lsp", {
	settings = {
		["luau-lsp"] = {
			completion = {
				imports = {
					enabled = true, -- enable auto imports
				},
			},
		},
	},
})

return {
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
}
