local fn = vim.fn

--- @class Utils
local utils = {}

--- @param feat string the feature name, like 'unix'
--- @return boolean
function utils.has(feat)
	return fn.has(feat) == 1
end

return utils
