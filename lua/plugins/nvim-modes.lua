return {
	"mvllow/modes.nvim",
	config = function()
		local color = require("defines.color")
		local visual = color.fg0
		local bg = color.bg0
		local insert = color.fg1
		local copy = color.sa0
		local delete = color.er0

		require("modes").setup({
			colors = {
				bg = bg.hex, -- Optional bg param, defaults to Normal hl group
				copy = copy.hex,
				delete = delete.hex,
				change = delete.hex, -- Optional param, defaults to delete
				format = copy.hex,
				insert = insert.hex,
				replace = visual.hex,
				select = visual.hex, -- Optional param, defaults to visual
				visual = visual.hex,
			},
			line_opacity = 0.125,
		})
	end,
}
