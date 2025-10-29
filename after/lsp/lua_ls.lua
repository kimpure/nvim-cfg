return {
	root_dir = function()
		return vim.fn.getcwd()
	end,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			telemetry = { enable = false },
			hint = {
				enable = false,
			},
		},
	},
}
