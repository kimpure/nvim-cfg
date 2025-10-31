local fn = vim.fn

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
--- @param using_windows? boolean using windows remove option (defulat: false)
function fs.remove_file(path, using_windows)
	if is_windows and using_windows then
		if fn.isdirectory(path) == 1 then
			fn.system({ "cmd", "/c", "rmdir", "/s", "/q", path })
		else
			fn.system({ "cmd", "/c", "del", "/f", "/q", path })
		end
	else
		fn.delete(path, "rf")
	end
end

--- @class Utils.FileSystem
utils.fs = fs

return utils
