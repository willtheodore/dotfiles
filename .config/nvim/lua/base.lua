local o = vim.o

-- colors
o.background = "dark"
o.termguicolors = true
vim.cmd("colorscheme spacegray-dark")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

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

