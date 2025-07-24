return {
	"mason-org/mason.nvim",
	lasy = false,
	cmd = "Mason",
	event = "BufReadPre",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
}
