pack.add({
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		boot = function()
			require("gitsigns").setup()
		end,
	},
})
