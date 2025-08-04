local lang = require("config.lang")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = lang.treesiter,
		highlight = { enable = true },
		indent = { enable = true },
		endwise = { enable = true },
	},
}
