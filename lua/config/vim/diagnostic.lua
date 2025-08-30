vim.diagnostic.config({
	virtual_text = { current_line = true },
	-- virtual_lines = { current_line = true },
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.api.nvim_set_hl(0, "DiagnosticUnused", { link = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })

