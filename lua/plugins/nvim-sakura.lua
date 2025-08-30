return {
	"anAcc22/sakura.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.opt.background = "dark" -- or "light"
		vim.cmd("colorscheme sakura") -- sets the colorscheme
	end,
}
