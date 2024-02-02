local M = {
	{
		"lunarvim/darkplus.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
	{
		lazy = false,
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 9999,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"Everblush/nvim",
		name = "everblush",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"NLKNguyen/papercolor-theme",
		lazy = false,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false,
		config = true,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"joshdick/onedark.vim",
		lazy = false,
		priority = 1000,
	},
	{
		"romainl/Apprentice",
		lazy = false,
		priority = 1000,
	},
	{
		"shaunsingh/solarized.nvim",
		lazy = false,
		priority = 1000,
	},
}

return M
