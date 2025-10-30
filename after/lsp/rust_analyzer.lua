vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust", "rs" },
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
				onSave = false,
			},
		},
	},
}
