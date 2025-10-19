local smart_splits = require("smart-splits")
local keymap = vim.keymap

keymap.set("n", "<C-left>", smart_splits.resize_left)
keymap.set("n", "<C-down>", smart_splits.resize_down)
keymap.set("n", "<C-up>", smart_splits.resize_up)
keymap.set("n", "<C-right>", smart_splits.resize_right)
