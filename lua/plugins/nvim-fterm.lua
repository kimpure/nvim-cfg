return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")

		fterm.setup({
			border = "rounded",
			cmd = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})

		vim.api.nvim_create_user_command("FTermOpen", fterm.open, { bang = true })
		vim.api.nvim_create_user_command("FTermClose", fterm.close, { bang = true })
	end,
}
