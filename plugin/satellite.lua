pack.add({
	{
		src = "github.com/lewis6991/satellite.nvim",
		boot = {
			"satellite",
			current_only = false,
			winblend = 50,
			handlers = {
				marks = {
					enable = false,
				},
				gitsigns = {
					enable = true,
					signs = {
						add = "│",
						change = "│",
						delete = "│",
					},
				},
			},
		},
	},
})
