local util = require("config.keymaps.util")
local mapping = util.mapping

local function hover()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end

mapping("K", hover)
