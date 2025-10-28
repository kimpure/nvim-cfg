local fn = vim.fn
local uv = vim.uv or vim.loop

--- @class Utils
local utils = {}

--- @param feat string the feature name, like 'unix'
--- @return boolean
function utils.has(feat)
	return fn.has(feat) == 1
end

local is_windows = utils.has("win32") or utils.has("win64")

--- @class Utils.FileSystem
local fs = {}
fs.path_prefix = is_windows and "\\" or "/"

--- Remove directory
--- @param path string target file path
function fs.remove_file(path)
	if is_windows then
		if fn.isdirectory(path) == 1 then
			fn.system({ "cmd", "/c", "rmdir", "/s", "/q", path })
		else
			fn.system({ "cmd", "/c", "del", "/f", "/q", path })
		end
	else
		local handle = uv.fs_scandir(path)

		if handle then
			while true do
				local name, type = uv.fs_scandir_next(handle)

				if not name then
					break
				end

				local full = path .. fs.path_prefix .. name

				if type == "directory" then
					fs.remove_file(full)
				else
					uv.fs_unlink(full)
				end
			end
		end

		uv.fs_rmdir(path)
	end
end

--- @class Utils.FileSystem
utils.fs = fs

return utils
