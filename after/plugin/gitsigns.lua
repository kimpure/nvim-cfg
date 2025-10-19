local gitsigns = require("gitsigns")

gitsigns.setup({
	word_diff = false,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd([[
            hi GitSignsChangeInline gui=reverse
            hi GitSignsAddInline gui=reverse
            hi GitSignsDeleteInline gui=reverse
        ]])
	end,
})
