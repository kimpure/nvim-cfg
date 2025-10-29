return {
	root_dir = function()
		return vim.fn.getcwd()
	end,
	filetypes = { "lua" },
	settings = {
		Lua = {
			codeLens = { enable = true },
			runtime = {
				version = "LuaJIT",
			},
			telemetry = { enable = false },
			workspace = { checkThirdParty = false },
		},
	},
}
