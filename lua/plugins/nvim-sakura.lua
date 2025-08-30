return {
	"anAcc22/sakura.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.cmd("colorscheme onedark")
	end,
}
