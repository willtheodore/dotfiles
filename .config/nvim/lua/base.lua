local o = vim.o
local g = vim.g

-- colors
o.background = "dark"
o.termguicolors = true
vim.cmd("colorscheme tokyonight")

do -- fix transparency
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
		"CursorLineNr",
		"EndOfBuffer",
	}

	for _, v in ipairs(groups) do
		pcall(function()
			local attrs =
				vim.tbl_extend("force", vim.api.nvim_get_hl_by_name(v, true), { bg = "NONE", ctermbg = "NONE" })
			attrs[true] = nil
			vim.api.nvim_set_hl(0, v, attrs)
		end)
	end
end

-- settings
o.hidden = true
o.exrc = true
o.hls = false
o.relativenumber = true
o.nu = true
o.errorbells = false
o.cursorline = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = false

o.scrolloff = 14

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.signcolumn = "yes"
o.colorcolumn = "100"

-- NERDTree
g.NERDTreeShowHidden = true
g.NERDTreeMinimalUI = true
g.NERDTreeMinimalMenu = true
