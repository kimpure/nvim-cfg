local lang = require("defines.lang")

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = lang.treesitter,
		highlight = { enable = true },
		indent = { enable = true },
		endwise = { enable = true },
	},
}
