local options = function()
	return {
		defaults = {
			-- keymaps = require("core.keymaps").telescope,
			vimgrep_arguments = {
				"rg",
				"-L",
				-- "--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = " ",
			selection_caret = " ",
			entry_prefix = "   ",
			path_display = { "smart" },
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.8,
					results_width = 0.9,
				},
				vertical = {
					mirror = false,
				},
				width = 0.9,
				height = 0.9,
				preview_cutoff = 120,
			},
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			mappings = {
				-- n = { ["q"] = require("telescope.actions").close },
			},
		},
		pickers = {
			find_files = {
				theme = "ivy",
				-- previewer = false,
				hidden = true,
				-- cache_picker = true,
			},
			live_grep = {
				-- cache_picker = true,
				-- 	theme = "dropdown",
				-- 	-- previewer = false,
			},
			find_buffers = {
				theme = "cursor",
				-- previewer = false,
			},
		},

		extensions_list = { "themes", "fzf", "media_files", "bookmarks", "rest", "flutter" },
		extensions = {
			media_files = {
				-- filetypes whitelist
				-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
				filetypes = { "png", "webp", "jpg", "jpeg" },
				find_cmd = "rg", -- find command (defaults to `fd`)
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	}
end

local config = function(_, opts)
	local telescope = require("telescope")
	telescope.setup(opts)

	-- load extensions
	for _, ext in ipairs(opts.extensions_list) do
		telescope.load_extension(ext)
	end
end
return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	cmd = "Telescope",
	dependencies = {
		-- "MattesGroeger/vim-bookmarks",
		-- "tom-anders/telescope-vim-bookmarks.nvim",
		"nvim-lua/plenary.nvim",
		"andrew-george/telescope-themes",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-telescope/telescope-media-files.nvim",
			dependencies = {
				"nvim-lua/popup.nvim",
			},
		},
	},
	config = config,
	opts = options,
}
