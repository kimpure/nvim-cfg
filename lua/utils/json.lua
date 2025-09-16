local function json(path)
	local uv = vim.uv or vim.loop
	local style_json_path = vim.fn.stdpath("config") .. "/" .. path

	local fd = uv.fs_open(style_json_path, "r", 438)

	if not fd then
		vim.notify("File not found: " .. style_json_path, vim.log.levels.ERROR)
		return
	end

	local stat = uv.fs_fstat(fd)
	local data = uv.fs_read(fd, stat.size, 0)
	uv.fs_close(fd)

	local ok, decoded = pcall(vim.json.decode, data)

	if not ok or not decoded then
		vim.notify("Failed to parse JSON: " .. decoded, vim.log.levels.ERROR)
		return
	end

	return decoded
end

return json
