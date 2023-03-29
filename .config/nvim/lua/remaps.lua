local map = require("utils").map

-- TELESCOPE
vim.g.mapleader = " "
map("n", "<Leader>f", [[:lua require("telescope.builtin").live_grep({grep_open_files = true})<CR>]])
map("n", "<Leader>p", [[:lua require("telescope.builtin").find_files()<CR>]])
map("n", "<Leader>h", [[:lua require("telescope.builtin").help_tags()<CR>]])

-- LSP
local lsp_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>d", [[:lua vim.diagnostic.open_float()<CR>]], lsp_opts)
vim.api.nvim_set_keymap("n", "[d", [[:lua vim.diagnostic.goto_prev()<CR>]], lsp_opts)
vim.api.nvim_set_keymap("n", "]d", [[:lua vim.diagnostic.goto_next()<CR>]], lsp_opts)

-- CMP
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Comments
map("n", "<Leader>cl", [[:CommentToggle]])
map("n", "<Leader>cv", [[:'<,'>CommentToggle]])

----- file browser
map("n", "<Leader>e", [[:Telescope file_browser<CR>]])

-- AUTOCMDS
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*" },
	command = [[:lua require("telescope.builtin").find_files()]],
})

vim.api.nvim_create_autocmd({
	"LspAttach",
	{
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- enable completition with <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	},
})
