local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
				["<Tab>"] = false,
				["<S-Tab>"] = false,
			},
			i = {
				["<Tab>"] = false,
				["<S-Tab>"] = false,
			},
		},
	},
})
