local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		-- "rafamaddriz/friendly-snippets"
		-- "windwp/nvim-autopairs",
		{ "tzachar/cmp-ai", dependencies = "nvim-lua/plenary.nvim" },
		{
			"tzachar/cmp-tabnine",
			build = "./install.sh",
			dependencies = "hrsh7th/nvim-cmp",
		},

		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
			config = function()
				require("codeium").setup({})
			end,
		},

		{ "vappolinario/cmp-clippy" },
	},
	opts = function()
		return require("plugins.configs.cmp")
	end,
	config = function(_, opts)
		require("cmp").setup(opts)
	end,
}

return M
