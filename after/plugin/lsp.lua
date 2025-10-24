require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.didChangeWatchedFiles = {
	dynamicRegistration = true,
}

vim.lsp.config("*", {
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 500,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_buf_conf", { clear = true }),
	callback = function(event_context)
		local client = vim.lsp.get_client_by_id(event_context.data.client_id)

		if not client then
			return
		end

		local bufnr = event_context.buf

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition({
				on_list = function(options)
					local unique_defs = {}
					local def_loc_hash = {}

					for _, def_location in pairs(options.items) do
						local hash_key = def_location.filename .. def_location.lnum

						if not def_loc_hash[hash_key] then
							def_loc_hash[hash_key] = true
							table.insert(unique_defs, def_location)
						end
					end

					options.items = unique_defs

					vim.fn.setloclist(0, {}, " ", options)

					if #options.items > 1 then
						vim.cmd.lopen()
					else
						vim.cmd([[silent! lfirst]])
					end
				end,
			})
		end, {
			silent = true,
			buffer = bufnr,
			desc = "go to definition",
		})

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "solid",
				max_height = 20,
				max_width = 130,
				close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
			})
		end, {
			silent = true,
			buffer = event_context.bufnr,
		})

		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
			silent = true,
			buffer = bufnr,
		})
	end,
	nested = true,
})

local lsp_servers = {
	clangd = "clangd",
	luau_lsp = "luau-lsp",
	lua_ls = "lua-language-server",
	vimls = "vim-language-server",
}

local registry = require("mason-registry")

for server_name, lsp_executable in pairs(lsp_servers) do
	local success, pkg = pcall(registry.get_package, lsp_executable)

	if success then
		if not pkg:is_installed() then
			pkg:install()
		end
	else
		vim.notify("LSP package not found: " .. lsp_executable, vim.log.levels.WARN)
	end

	if vim.lsp.enable then
		vim.lsp.enable(server_name)
	else
		vim.lsp.start({
			name = server_name,
			cmd = { pkg:get_install_path() .. "/bin/" .. lsp_executable },
			root_dir = vim.fn.getcwd(),
		})
	end
end
