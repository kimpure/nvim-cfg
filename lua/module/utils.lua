local fn = vim.fn
local uv = vim.uv or vim.loop

local char = string.char
local format = string.format
local gsub = string.gsub
local match = string.match

local floor = math.floor

local ffi = require("ffi")
local shell32 = ffi.load("Shell32")

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
--- @param p string target path
function fs.remove_file(p)
	if is_windows then
        if fn.isdirectory(p) == 1 then
            fn.system({ "cmd", "/c", "rmdir", "/s", "/q", p })
        else
            fn.system({ "cmd", "/c", "del", "/f", "/q", p })
        end
	else
		local handle = uv.fs_scandir(p)

		if handle then
			while true do
				local name, type = uv.fs_scandir_next(handle)

				if not name then
					break
				end

				local full = p .. fs.path_prefix .. name

				if type == "directory" then
					fs.remove_file(full)
				else
					uv.fs_unlink(full)
				end
			end
		end

		uv.fs_rmdir(p)
	end
end

if is_windows then
	ffi.cdef([[
    typedef struct _SHFILEOPSTRUCTW {
        void* hwnd;
        uint32_t wFunc;
        const wchar_t* pFrom;
        const wchar_t* pTo;
        uint16_t fFlags;
        int fAnyOperationsAborted;
        void* hNameMappings;
        const wchar_t* lpszProgressTitle;
    } SHFILEOPSTRUCTW;

    int SHFileOperationW(SHFILEOPSTRUCTW* lpFileOp);
    ]])
end

local function utf8_to_utf16le(str)
	local out = {}
	local i = 1
	local n = #str
	while i <= n do
		local c = str:byte(i)
		local code
		if c < 0x80 then
			code = c
			i = i + 1
		elseif c < 0xE0 then
			code = bit.bor(bit.lshift(bit.band(c, 0x1F), 6), bit.band(str:byte(i + 1), 0x3F))
			i = i + 2
		elseif c < 0xF0 then
			code = bit.bor(
				bit.lshift(bit.band(c, 0x0F), 12),
				bit.lshift(bit.band(str:byte(i + 1), 0x3F), 6),
				bit.band(str:byte(i + 2), 0x3F)
			)
			i = i + 3
		else
			code = bit.bor(
				bit.lshift(bit.band(c, 0x07), 18),
				bit.lshift(bit.band(str:byte(i + 1), 0x3F), 12),
				bit.lshift(bit.band(str:byte(i + 2), 0x3F), 6),
				bit.band(str:byte(i + 3), 0x3F)
			)
			i = i + 4
		end

		if code <= 0xFFFF then
			table.insert(out, string.char(bit.band(code, 0xFF), bit.rshift(code, 8)))
		else
			code = code - 0x10000
			local high = 0xD800 + bit.rshift(code, 10)
			local low = 0xDC00 + bit.band(code, 0x3FF)
			table.insert(out, string.char(bit.band(high, 0xFF), bit.rshift(high, 8)))
			table.insert(out, string.char(bit.band(low, 0xFF), bit.rshift(low, 8)))
		end
	end
	table.insert(out, "\0\0")
	return table.concat(out)
end

--- Recycle file
--- @param p string target path
function fs.recycle_file(p)
	if is_windows then
		if fn.isdirectory(p) == 1 and not match(p, "[\\/]$") then
			p = p .. "\\"
		end

		local pathw = utf8_to_utf16le(p)

        --- @diagnostic disable
		local fop = ffi.new("SHFILEOPSTRUCTW")

		fop.wFunc = 3
		fop.pFrom = ffi.cast("const wchar_t*", pathw)
		fop.pTo = nil
		fop.fFlags = 0x40 + 0x10
		fop.hwnd = nil
		fop.hNameMappings = nil
		fop.lpszProgressTitle = nil
		fop.fAnyOperationsAborted = 0

		shell32.SHFileOperationW(fop)
	else
		-- You should have trash-cli
		vim.fn.system({ "trash", vim.fn.fnameescape(p) })
	end
end

--- @class Utils.FileSystem
utils.fs = fs

return utils
