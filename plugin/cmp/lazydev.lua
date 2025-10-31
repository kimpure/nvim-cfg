pack.add({
	{
		src = "github.com/folke/lazydev.nvim",
		boot = {
			"lazydev",
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},
})
