local options = {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dart",
		"dockerfile",
		"gitignore",
		"graphql",
		"html",
		"http",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"rust",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
		"prisma",
	},
	sync_install = false,
	additional_vim_regex_highlighting = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },

	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		-- keymaps = {
		-- 	init_selection = "<C-space>",
		-- 	node_incremental = "<C-space>",
		-- 	scop_incremental = "<C-space>",
		-- 	node_decremental = "<bs>",
		-- },
	},
}

-- this makes bug when use bufferline (when closes a buffer) I'll fix it latter.
return {
	"nvim-treesitter/nvim-treesitter",
	opts = options,
	build = ":TSUpdate",
	cmd = {
		"TSInstall",
		"TSUninstall",
		"TSUpdate",
		"TSUpdateSync",
		"TSInstallInfo",
		"TSInstallSync",
		"TSInstallFromGrammar",
	},
	event = { "User FileOpened", "BufReadPre", "BufNewFile" },
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
