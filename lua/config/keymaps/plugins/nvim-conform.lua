local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("<S-f>", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)
