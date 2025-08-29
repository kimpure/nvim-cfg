local module = {}

module.config = {
	lua = {
		lsp = "lua_ls",
		formatters = { "stylua" },
	},
    luau = {
        lsp = "luau_lsp",
        formatters = { "stylua" },
    },
	python = {
		lsp = "pyright",
		formatters = { "black", "isort" },
	},
	typescript = {
		lsp = "tsp_server",
		formatters = { "xo" },
	},
	javascript = {
		lsp = "tsp_server",
		formatters = { "xo" },
	},
	rust = {
		lsp = "rust_analyzer",
		formatters = { "rustfmt" },
	},
}

module.formatters = {}
do
	for k, v in pairs(module.config) do
		module.formatters[k] = v.formatters
	end
end

module.lsp = {}
do
	for _, v in pairs(module.config) do
		module.lsp[#module.lsp + 1] = v.lsp
	end
end

module.treesitter = {}
do
	for k, _ in pairs(module.config) do
		module.treesiter[#module.treesiter + 1] = k
	end
end

return module
