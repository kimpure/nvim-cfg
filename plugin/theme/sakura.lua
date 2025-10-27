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

pack.add({
	{ src = "github.com/rktjmp/lush.nvim" },
    { 
        src = "gtihub.com/kimpure/transparent.nvim", 
        boot = { "transparent" }, 
    },
    {
		src = "github.com/kimpure/sakura.nvim",
		boot = function()
			vim.cmd.colorscheme("sakura")
		end,
	},
})
