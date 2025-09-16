local module = {}

-- (dir: string) -> { file }
function module.read_dir_files(path)
	local lua_dir = vim.fn.stdpath("config") .. "/lua/" .. path:gsub("%.", "/")
	return vim.fn.globpath(lua_dir, "*.lua", false, true)
end

-- (dir: string) -> { string }
function module.read_dir(path)
	local files = module.read_dir_files(path)
	local file_names = {}

	for i = 1, #files do
		file_names[i] = vim.fn.fnamemodify(files[i], ":t:r")
	end

	return file_names
end

return module
