local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("K", function()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end)
