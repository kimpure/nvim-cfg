return {
	"kimpure/warp.nvim",
	init = function()
		local warp = require("warp").setup({
			default = { "" },
		})

		vim.api.nvim_create_user_command("Warp", warp.warp, { nargs = "+" })
		vim.api.nvim_create_user_command("WarpVisual", warp.warp_visual, { nargs = "+" })
	end,
}
