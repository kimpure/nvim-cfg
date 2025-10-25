pack.add({
	{
		src = "github.com/folke/lazydev.nvim",
		boot = {
			"lazydev",
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ src = "github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "github.com/hrsh7th/cmp-cmdline" },
	{ src = "github.com/hrsh7th/cmp-path" },
	{ src = "github.com/hrsh7th/cmp-buffer" },
	{ src = "github.com/hrsh7th/nvim-cmp" },
})
