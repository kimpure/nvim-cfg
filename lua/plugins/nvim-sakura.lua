return {
	"kimpure/sakura.nvim",
	dependencies = "rktjmp/lush.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.opt.background = "dark" -- "dark" | "light"
		vim.cmd("colorscheme sakura") -- sets the colorscheme
	end,
}
