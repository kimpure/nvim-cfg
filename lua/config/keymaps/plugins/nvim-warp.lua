local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("'", "<CMD>WarpVisual '<CR>", "v")
mapping('"', '<CMD>WarpVisual "<CR>', "v")
mapping("(", "<CMD>WarpVisual ( )<CR>", "v")
mapping("{", "<CMD>WarpVisual { }<CR>", "v")
mapping("[", "<CMD>WarpVisual [ ]<CR>", "v")
