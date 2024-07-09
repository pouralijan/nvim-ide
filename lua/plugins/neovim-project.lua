return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"/mnt/W/S/R/*",
			"/mnt/W/MahsanCo/S/*",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	config = function(_, opts)
		local neovim_project = require("neovim-project")
		neovim_project.setup(opts)

		-- :Telescope neovim-project discover - find a project based on patterns.
		--
		-- :Telescope neovim-project history - select a project from your recent history.
		--
		-- :NeovimProjectLoadRecent
		vim.keymap.set("n", "<leader>ph", "<CMD>Telescope neovim-project history<CR>")
		vim.keymap.set("n", "<leader>pd", "<CMD>Telescope neovim-project discover<CR>")
		vim.keymap.set("n", "<leader>pr", "<CMD>NeovimProjectLoadRecent<CR>")
	end,

	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
