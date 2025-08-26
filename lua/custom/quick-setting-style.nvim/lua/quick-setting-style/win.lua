local api = vim.api

local ceil = math.ceil

local function win_dimension()
	local columns = vim.o.columns
	local lines = vim.o.lines

	local width = ceil(columns * 0.8)
	local height = ceil(lines * 0.8 - 4)

	local col = ceil((columns - width) * 0.5)
	local row = ceil((lines - height) * 0.5 - 1)

	return {
		width = width,
		height = height,
		col = col,
		row = row,
	}
end

local function create_buf()
	return api.nvim_create_buf(false, true)
end

local module = {}

function module.create()
	local dimension = win_dimension()
	local buf = create_buf()

	local win = api.nvim_open_win(buf, true, {
		relative = "editor",
		border = "rounded",
		style = "minimal",
		width = dimension.width,
		height = dimension.height,
		col = dimension.col,
		row = dimension.row,
	})

	api.nvim_create_autocmd("InsertEnter", {
		buffer = buf,
		callback = function()
			vim.cmd("stopinsert")
		end,
	})

	return {
		win = win,
		buf = buf,
	}
end

return module
