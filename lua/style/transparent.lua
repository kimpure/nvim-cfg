local groups = {
	"Normal",
	"NormalNC",
	"NeoTreeNormal",
	"NeotreeNormalNC",
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
	"WinSeparator",
	"MsgArea",
	"Pmenu",
	"PmenuSel",
}

local function transparent()
	for _, group in ipairs(groups) do
		vim.cmd("highlight " .. group .. " guibg=NONE ctermbg=NONE")
	end
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "ColorScheme" }, { callback = transparent })

transparent()
