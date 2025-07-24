return {
	name = "CPP",
	mason = {
		"cpp",
	},
	plugins = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "neovim/nvim-lspconfig" },
	},
	-- config = function()
	-- 	vim.opt.number = true
	-- end,
}
