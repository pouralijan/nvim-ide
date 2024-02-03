return {
	lazy = false,
	"mhartington/formatter.nvim",
	opts = function()
		return require("plugins.configs.formatter")
	end,
	config = function(_, opts)
		require("formatter").setup(opts)
	end,
}
