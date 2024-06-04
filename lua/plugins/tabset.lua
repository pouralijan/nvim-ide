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
			dart = {
				tabwidth = 2,
				expandtab = true,
			},
			yaml = {
				tabwidth = 2,
				expandtab = true,
			},
		},
	},
	config = function(_, opts)
		require("tabset").setup(opts)
	end,
}
