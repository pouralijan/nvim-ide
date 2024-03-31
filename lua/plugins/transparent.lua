return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function(_, opts)
		local transparent = require("transparent")
		transparent.setup(opts)
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("NeoTree")
		-- transparent.clear_prefix("lualine")
	end,
}
