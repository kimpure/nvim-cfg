local cmp = require("cmp")

require("cmp_nvim_lsp")
require("cmp_path")
require("cmp_buffer")
require("cmp_cmdline")

cmp.setup({
	preselect = cmp.PreselectMode.None,
	mapping = cmp.mapping.preset.insert({
		["<Down>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end,
		["<Up>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end,
		["<Tab>"] = function(fallback)
			if cmp.visible() and cmp.get_selected_entry() then
				cmp.confirm({ select = false })
			else
				fallback()
			end
		end,
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.close(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{
			name = "buffer",
			keyword_length = 2,
		},
		{
			name = "lazydev",
			group_index = 0,
		},
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,menuone,noselect,noinsert",
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "none",
		}),
		documentation = cmp.config.window.bordered({
			border = "none",
		}),
	},
	view = {
		entries = "custom",
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
