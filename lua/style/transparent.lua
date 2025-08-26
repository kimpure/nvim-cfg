local groups = {
	"Normal",
	"NormalNC",
	"Comment",
	"Constant",
	"Special",
	"Identifier",
	"Statement",
	"PreProc",
	"Type",
	"Underlined",
	"Todo",
	"String",
	"Function",
	"Conditional",
	"Repeat",
	"Operator",
	"Structure",
	"LineNr",
	"NonText",
	"SignColumn",
	"CursorLine",
	"CursorLineNr",
	"StatusLine",
	"StatusLineNC",
	"EndOfBuffer",
}

local function transparent()
	for i = 1, #groups do
		vim.cmd("highlight " .. groups[i] .. " guibg=NONE ctermbg=NONE")
	end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent })

transparent()
