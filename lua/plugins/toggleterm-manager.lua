return {
	"ryanmsnyder/toggleterm-manager.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
	},
	lazy = false,

	config = function(_, opts)
		local toggleterm_manager = require("toggleterm-manager")
		local actions = toggleterm_manager.actions

		toggleterm_manager.setup({
			mappings = {
				i = {
					["<CR>"] = { action = actions.create_and_name_term, exit_on_action = true },
					["<C-d>"] = { action = actions.delete_term, exit_on_action = false },
				},
				n = {
					["<CR>"] = { action = actions.create_and_name_term, exit_on_action = true },
					["x"] = { action = actions.delete_term, exit_on_action = false },
				},
			},
		})
	end,
}
