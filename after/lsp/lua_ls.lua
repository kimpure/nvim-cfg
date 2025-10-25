return {
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			hint = {
				enable = true,
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
