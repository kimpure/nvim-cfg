pack.add({
	{
		src = "github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		boot = function()
			require("nvim-autopairs").setup()
		end,
	},
})
