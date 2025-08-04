return function(dir)
	local lua_dir = vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/")
	local files = vim.fn.globpath(lua_dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		local module = dir .. "." .. filename
		pcall(require, module)
	end
end
