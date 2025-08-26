-- Setup lazy.nvim
local uv = vim.uv or vim.loop
local local_plugins_dir = vim.fn.stdpath("config") .. "/lua/custom"

local function load_local_plugins(path)
	local plugins = {}
	local handle = uv.fs_scandir(path)
	
    if not handle then
		return plugins
	end

	while true do
		local name, typ = uv.fs_scandir_next(handle)
		if not name then
			break
		end
		if typ == "directory" then
			table.insert(plugins, {
				dir = path .. "/" .. name,
				name = name,
			})
		end
	end
	return plugins
end

local spec = { { import = "plugins" } }

vim.list_extend(spec, load_local_plugins(local_plugins_dir))

require("lazy").setup({
	spec = spec,
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },

	ui = {
		border = "rounded",
	},
})
