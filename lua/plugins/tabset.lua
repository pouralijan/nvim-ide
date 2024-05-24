return {
	"FotiadisM/tabset.nvim",
	lazy = false,
	opts = {
		defaults = {
			tabwidth = 4,
			expandtab = true,
		},
		languages = {
			cpp = {
				tabwidth = 4,
				expandtab = false,
			},
			c = {
				tabwidth = 4,
				expandtab = false,
			},
		},
	},
	config = function(_, opts)
		require("tabset").setup(opts)
	end,
}
