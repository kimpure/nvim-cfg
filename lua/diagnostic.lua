local diagnostic = vim.diagnostic
local api = vim.api

diagnostic.config({
	virtual_text = { current_line = true },
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,

	float = {
		source = true,
		header = "Diagnostics:",
		prefix = " ",
		border = "single",
		max_height = 10,
		max_width = 130,
		close_events = { "CursorMoved", "BufLeave", "WinLeave" },
	},
})

local set_qflist = function(buf_num, severity)
	local diagnostics = nil
	diagnostics = diagnostic.get(buf_num, { severity = severity })

	local qf_items = diagnostic.toqflist(diagnostics)
	vim.fn.setqflist({}, " ", { title = "Diagnostics", items = qf_items })

	vim.cmd([[copen]])
end

vim.keymap.set("n", "<space>qw", diagnostic.setqflist, { desc = "put window diagnostics to qf" })
vim.keymap.set("n", "<space>qb", function()
	set_qflist(0)
end, { desc = "put buffer diagnostics to qf" })

api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		if #vim.diagnostic.get(0) == 0 then
			return
		end

		if not vim.b.diagnostics_pos then
			vim.b.diagnostics_pos = { nil, nil }
		end

		local cursor_pos = api.nvim_win_get_cursor(0)

		if not vim.deep_equal(cursor_pos, vim.b.diagnostics_pos) then
			diagnostic.open_float(nil, {
				border = "none",
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				scope = "cursor",
			})
		end

		vim.b.diagnostics_pos = cursor_pos
	end,
})
