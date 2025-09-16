local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("<C-A-Right>", "<Cmd>tabnext<CR>")
mapping("<C-A-Left>", "<Cmd>tabprevious<CR>")
mapping("<C-t>", "<Cmd>tabnew<CR>")
mapping("<C-w>", "<Cmd>tabclose<CR>")
