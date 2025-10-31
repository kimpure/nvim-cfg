pack.add({
	{
		src = "github.com/folke/lazydev.nvim",
		boot = {
			"lazydev",
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},
	{ src = "github.com/onsails/lspkind.nvim" },
	{ src = "github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "github.com/hrsh7th/cmp-cmdline" },
	{ src = "github.com/hrsh7th/cmp-path" },
	{ src = "github.com/hrsh7th/cmp-buffer" },
	{ src = "github.com/hrsh7th/nvim-cmp" },

	{ src = "github.com/lopi-py/luau-lsp.nvim" },
	{ src = "github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "github.com/mason-org/mason.nvim" },
	{ src = "github.com/neovim/nvim-lspconfig" },

	{ src = "github.com/kimpure/trash.nvim" },
	{ src = "github.com/nvim-lua/plenary.nvim" },
	{ src = "github.com/nvim-tree/nvim-tree.lua" },

	{
		src = "github.com/lewis6991/gitsigns.nvim",
		boot = {
			"gitsigns",
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "┃" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "┃" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
		},
	},

	{
		src = "github.com/lukas-reineke/indent-blankline.nvim",
		boot = { "ibl" },
	},

	{
		src = "github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		boot = { "nvim-autopairs" },
	},

	{ src = "github.com/samjwill/nvim-unception" },

	{
		src = "github.com/lewis6991/satellite.nvim",
		boot = {
			"satellite",
			current_only = false,
			winblend = 0,
			handlers = {
				marks = {
					enable = false,
				},
				gitsigns = {
					enable = true,
					signs = {
						add = "│",
						change = "│",
						delete = "│",
					},
				},
			},
		},
	},

	{
		src = "github.com/2KAbhishek/nerdy.nvim",
		boot = {
			"nerdy",
			max_recents = 30,
		},
	},
	{
		src = "github.com/DaikyXendo/nvim-material-icon",
		boot = {
			"nvim-web-devicons",
			override_by_filename = {
				[".luaurc"] = {
					icon = "",
					color = "#007ABF",
					name = "Luaurc",
				},
			},
		},
	},

	{
		src = "github.com/kimpure/transparent.nvim",
		boot = {
			"transparent",
		},
	},
	{ src = "github.com/rktjmp/lush.nvim" },
	{
		src = "github.com/kimpure/sakura.nvim",
		boot = function()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					local colors = {
						add = "#81b88b",
						change = "#e2c08d",
						delete = "#c74e39",
						ignore = "#9d9d9d",
					}

					vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = colors.add, bold = false, cterm = nil })
					vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = colors.change, bold = false, cterm = nil })
					vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = colors.delete, bold = false, cterm = nil })
					vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = colors.ignore })

					vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { bold = false })
					vim.api.nvim_set_hl(0, "NvimTreeFileName", { bold = false })
					vim.api.nvim_set_hl(0, "NvimTreeFolderName", { bold = false })
					vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { bold = false })

					vim.api.nvim_set_hl(0, "Directory", { bold = false })

					vim.api.nvim_set_hl(0, "GitSignsChangeInline", { reverse = true, bg = colors.change })
					vim.api.nvim_set_hl(0, "GitSignsAddInline", { reverse = true, bg = colors.add })
					vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { reverse = true, bg = colors.delete })
				end,
			})

			vim.cmd.colorscheme("sakura")
		end,
	},
})
