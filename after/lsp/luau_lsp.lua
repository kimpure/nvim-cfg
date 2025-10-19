local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end

return {
	cmd = "luau-lsp",
	filetypes = { "luau" },
	settings = {
		["luau-lsp"] = {
			platform = {
				type = rojo_project() and "roblox" or "standard",
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
}
