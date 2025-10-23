pack.add({
	{
		src = "https://github.com/lukas-reineke/indent-blankline.nvim",
		boot = function()
			require("ibl").setup()
		end,
	},
})
