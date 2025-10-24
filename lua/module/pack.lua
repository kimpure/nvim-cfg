--- @class Pack
local pack = {}

local data_path = vim.fn.stdpath("data")
local opt_path = data_path .. "/site/pack/plugins/opt/"

local match = string.match
local insert = table.insert

--- @param src string package url
--- @param name string? package name
--- @param version string? package version
--- @return Pack.Spec
local function get_package(src, name, version)
	name = name or match(src, "^.+/(.+)$")
	local path = opt_path .. name

	if vim.fn.empty(vim.fn.glob(path)) > 0 then
		local cmd = { "git", "clone", "--depth=1" }

		if version then
			insert(cmd, "--branch")
			insert(cmd, version)
		end

		insert(cmd, src)
		insert(cmd, path)

		vim.fn.system(cmd)

		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({ { "Failed to clone " .. name } }, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end

	return {
		src = src,
		name = name,
		version = version,
	}
end

--- @class Pack.Spec
--- @field src string URI from which to install and pull updates
--- @field name string Name of plugin
--- @field version string? Use for install and updates
--- @field load  boolean? Load plugin status

--- @type table<string, Pack.Spec>
local plugs = {}

--- @type table<string, string>
local not_load_plugins = {}

--- @class Pack.AddSpec
--- @field src string
--- @field version? string
--- @field boot? fun()
--- @field event string? Load plugin event

--- Add packages
--- @param specs Pack.AddSpec[]
function pack.add(specs)
	for i = 1, #specs do
		local spec = specs[i]
		local name = match(spec.src, "^.+/(.+)$")
		local event = spec.event

		plugs[name] = get_package(spec.src, name, spec.version)

		if event then
			not_load_plugins[name] = vim.api.nvim_create_autocmd(event, {
				once = true,
				callback = function()
					vim.cmd("packadd " .. name)

					if spec.boot then
						spec.boot()
					end

					vim.api.nvim_del_autocmd(not_load_plugins[name])
				end,
			})
		else
			vim.cmd("packadd " .. name)

			if spec.boot then
				spec.boot()
			end
		end
	end
end

--- Delete packages
--- @param names string[] target package names
function pack.del(names)
	for i = 1, #names do
		local name = names[i]
		local path = opt_path .. name
		plugs[name] = nil
		package.loaded[name] = nil
		vim.fn.delete(path, "rf")
	end
end

--- @class Pack.PluginInfo
--- @field spec Pack.Spec plugin pack
--- @field path string path on disk

--- Get packages pack
--- @param names string[] target package names
--- @return table<string, Pack.PluginInfo>
function pack.get(names)
	local result = {}

	for i = 1, #names do
		local name = names[i]

		if plugs[name] then
			result[name] = {
				spec = plugs[name],
				path = opt_path .. name,
			}
		end
	end

	return result
end

--- Update packages
--- @param names string[] target package names
function pack.update(names)
	for i = 1, #names do
		local name = names[i]

		if plugs[name] then
			local src = plugs[names[i]].src
			pack.del({ name })
			pack.add({ { src = src } })
		else
			vim.api.nvim_echo({
				{ "Failed to update " .. name },
				{ "package not found" },
			}, true, {})
		end
	end
end

return pack
