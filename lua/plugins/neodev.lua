return {
	"folke/neodev.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		local neodev = require("neodev")
		neodev.setup(opts)
	end,
}
