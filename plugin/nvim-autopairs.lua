pack.add({
	{
		src = "https://github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		boot = function()
			require("nvim-autopairs").setup()
		end,
	},
})
