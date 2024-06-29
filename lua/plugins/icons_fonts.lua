return {
	lazy = true,
	"DaikyXendo/nvim-material-icon",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		-- require("nvim-material-icon").setup(opts)
		require("nvim-web-devicons").has_loaded()
		require("nvim-web-devicons").refresh()
	end,
}
