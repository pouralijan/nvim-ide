return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
        loop = true,
	-- 	-- your configuration comes here
	-- 	-- or leave it empty to use the default settings
	-- 	-- refer to the configuration section below
	-- 	preset = "modern",
	-- 	-- preset = "helix",
	-- 	delay = 2,
	},
	-- keys = {
	-- 	{
	-- 		"<leader>?",
	-- 		function()
	-- 			require("which-key").show({ global = false })
	-- 		end,
	-- 		desc = "Buffer Local Keymaps (which-key)",
	-- 	},
	-- },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}
