local lang = require("defines.lang")

return {
	"stevearc/conform.nvim",
	init = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = lang.formatters,
		})
	end,
}
