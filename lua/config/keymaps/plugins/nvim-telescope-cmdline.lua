local util = require("config.keymaps.util")
local mapping = util.mapping

mapping(":", ":Telescope cmdline<CR>", "n", { desc = "Cmdline" })
