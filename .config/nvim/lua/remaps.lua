local map = require("utils").map

-- TELESCOPE
vim.g.mapleader = " "
map("n", "<Leader>f", [[:lua require("telescope.builtin").live_grep({grep_open_files = true})<CR>]])
map("n", "<Leader>F", [[:lua require("telescope.builtin").live_grep({grep_open_files = false})<CR>]])
map("n", "<Leader>p", [[:lua require("telescope.builtin").find_files({hidden=true})<CR>]])
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
map("n", "<Leader>e", [[:NERDTreeFocus<CR>]])

----- tabs
map("n", "<Leader>tn", [[:tabnew<CR>]])
map("n", "<Leader>tc", [[:tabclose<CR>]])
map("n", "<Leader>]", [[:tabnext<CR>]])
map("n", "<Leader>[", [[:tabprevious<CR>]])
map("n", "<Leader>t1", [[:tabn 1<CR>]])
map("n", "<Leader>t2", [[:tabn 2<CR>]])
map("n", "<Leader>t3", [[:tabn 3<CR>]])
map("n", "<Leader>t4", [[:tabn 4<CR>]])
map("n", "<Leader>t5", [[:tabn 5<CR>]])
