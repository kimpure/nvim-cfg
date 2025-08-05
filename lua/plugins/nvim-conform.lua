local lang = require("defines.lang")

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = lang.formatters,
		})

		vim.api.nvim_create_user_command("FormatFile", function()
			conform.format({ async = true, lsp_fallback = true })
		end, { bang = true })
	end,
}
