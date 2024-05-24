return {
	"karb94/neoscroll.nvim",
	lazy = false,
	config = function(_, opts)
		require("neoscroll").setup(opts)
	end,
}
