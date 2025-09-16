local json = require("utils.json")

local style = json("lua/config/style/style.json")

if not style then
	return
end

for name, enable in pairs(style) do
	if enable then
		require("style." .. name)
	end
end
