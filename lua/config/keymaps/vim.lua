local util = require("config.keymaps.util")
local mapping = util.mapping

mapping("<A-Right>", ":wincmd l<CR>")
mapping("<A-Left>", ":wincmd h<CR>")
mapping("<A-Down>", ":wincmd j<CR>")
mapping("<A-Up>", ":wincmd k<CR>")

mapping("<", "<gv", "v")
mapping(">", ">gv", "v")

mapping("<C-\\>", "<cmd>terminal<CR>")
mapping("<ESC>", "<C-\\><C-n>", "t")
