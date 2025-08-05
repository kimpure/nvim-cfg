return {
	"numToStr/FTerm.nvim",
	init = function()
		local fterm = require("FTerm")

		fterm.setup({
			border = "rounded",
			cmd = require("defines.shell").path,
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})

		vim.api.nvim_create_user_command("FTermOpen", fterm.open, { bang = true })
		vim.api.nvim_create_user_command("FTermClose", fterm.close, { bang = true })
	end,
}
