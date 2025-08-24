return {
	"mrjones2014/smart-splits.nvim",
	init = function()
		vim.keymap.set("n", "<C-left>", require("smart-splits").resize_left)
		vim.keymap.set("n", "<C-down>", require("smart-splits").resize_down)
		vim.keymap.set("n", "<C-up>", require("smart-splits").resize_up)
		vim.keymap.set("n", "<C-right>", require("smart-splits").resize_right)
	end,
}
