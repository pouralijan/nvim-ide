return {
	name = "Lua",
	mason = {
		"lua-language-server",
		"vim-language-server",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"json-to-struct",
		"luacheck",
		"misspell",
		"revive",
		"shellcheck",
		"shfmt",
		"staticcheck",
		"vint",
	},
	lsp = {
		"lus_ls",
	},
	plugins = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "neovim/nvim-lspconfig" },
	},
}
