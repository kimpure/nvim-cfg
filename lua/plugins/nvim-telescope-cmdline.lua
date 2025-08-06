return {
	"jonarrien/telescope-cmdline.nvim",
	config = function()
		require("telescope").setup({
			extensions = {
				cmdline = {
					picker = {
						layout_config = {
							width = 90,
							height = 25,
						},
					},

					mappings = {
						edit = "<Tab>",
						run_selection = "<C-CR>",
						run_input = "<CR>",
					},

					overseer = {
						enabled = true,
					},
				},
			},
		})
	end,
}
