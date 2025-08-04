local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("<C-\\>", "<CMD>FTermOpen<CR>")
mapping("<C-\\>", "<CMD>FTermClose<CR>", "t")
