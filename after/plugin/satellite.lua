local satellite = require("satellite")

satellite.setup({
	current_only = false,
	winblend = 50,
	handlers = {
		marks = {
			enable = false,
		},
	},
})
