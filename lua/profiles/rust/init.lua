return {
	name = "Rust",
	mason = {
		"codelldb",
	    "clangd",
        "slint_lsp"
	},
	plugins = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "neovim/nvim-lspconfig" },},
	config = function()
		vim.opt.number = true
	end,
}
