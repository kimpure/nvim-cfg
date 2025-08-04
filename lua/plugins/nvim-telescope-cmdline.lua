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
						complete = "<Tab>",
						run_selection = "<C-CR>",
						run_input = "<CR>",
					},

					overseer = {
						enabled = true,
					},
				},
			},
		})

		vim.api.nvim_set_keymap("n", ":", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
	end,
}
