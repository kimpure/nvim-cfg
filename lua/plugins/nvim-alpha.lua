return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "  > Open tree", ":Neotree<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
			dashboard.button("q", "🗙 > Quit nvim", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
