return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		lazy = false,
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		opts = {

			keybinds = {
				{
					"<leader>rr",
					"<cmd>Rest run<cr>",
					"Run request under the cursor",
				},
				{
					"<leader>rl",
					"<cmd>Rest run last<cr>",
					"Re-run latest request",
				},
			},
		},
		config = function(_, opts)
			-- -- first load extension
			-- require("telescope").load_extension("rest")
			-- -- then use it, you can also use the `:Telescope rest select_env` command
			-- require("telescope").extensions.rest.select_env()
			require("rest-nvim").setup(opts)
		end,
	},
}
