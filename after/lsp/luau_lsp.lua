local function rojo_project()
	return vim.fs.root(0, function(name)
		return name:match(".+%.project%.json$")
	end)
end

if rojo_project() then
	vim.filetype.add({
		extension = {
			lua = function(path)
				return path:match("%.nvim%.lua$") and "lua" or "luau"
			end,
		},
	})
end

return {
	cmd = { "luau-lsp" },
	filetypes = { "luau" },
	settings = {
		["luau-lsp"] = {
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
    handlers = {
		["textDocument/publishDiagnostics"] = function(_, result, ctx)
			if not result then
				return
			end

			local filtered = {}

			for _, diag in ipairs(result.diagnostics) do
				if diag.severity ~= vim.diagnostic.severity.WARN and diag.severity ~= vim.diagnostic.severity.HINT then
					table.insert(filtered, diag)
				end
			end

			result.diagnostics = filtered
			vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
		end,
	},
}
