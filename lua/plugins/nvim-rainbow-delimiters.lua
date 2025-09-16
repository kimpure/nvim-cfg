return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		vim.g.loaded_matchparen = 1

		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#5caeef" }) -- foreground1
		vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#dfb976" }) -- foreground2
		vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#c172d9" }) -- foreground3
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#4fb1bc" }) -- foreground4
		vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#97c26c" }) -- foreground5
		vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#abb2c0" }) -- foreground6
		vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#db6165" }) -- unexpectedBracket
	end,
	opts = {},
}
