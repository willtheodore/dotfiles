--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local status2, mason = pcall(require, "mason")
if not status2 then
	return
end

local status3, mason_lsp = pcall(require, "mason-lspconfig")
if not status3 then
	return
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

----------- INITALIZE MASON -----------
mason.setup()
mason_lsp.setup()

---------- START LSP Sources ----------

-- Pyright
nvim_lsp.pyright.setup({})

-- HTML
nvim_lsp.html.setup({})

-- Typescript
nvim_lsp.tsserver.setup({
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	capabilities = capabilities,
})

-- Lua-language-server
nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Sourcekit
nvim_lsp.sourcekit.setup({})

-- Emmet
nvim_lsp.emmet_ls.setup({})

-- Bash
nvim_lsp.bashls.setup({
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zshrc)",
	},
	filetypes = { "sh", "zsh" },
})

---------- END LSP Sources ----------

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
