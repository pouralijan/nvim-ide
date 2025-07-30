return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"mason-org/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		handlers = {},
		ensure_installed = {
			"codelldb",
		},
	},
}
