-- AUTOCMDS
local customActions = vim.api.nvim_create_augroup("CustomActions", {})
-- Remove white space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = customActions,
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- Open Find Files when a specific file is not named
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = customActions,
	pattern = { "*" },
	callback = function(ev)
		local file = ev.file
		if file and string.find(file, "NERD_tree") ~= nil then
			require("telescope.builtin").find_files({ hidden = true })
		end
	end,
})

-- Setup LSP remaps
vim.api.nvim_create_autocmd({
	"LspAttach",
}, {
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
	end,
})
