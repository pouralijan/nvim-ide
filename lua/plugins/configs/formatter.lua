-- Utilities for creating configurations
local util = require("formatter.util")
local defaults = require("formatter.defaults")

return {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
		python = {
			require("formatter.filetypes.python").autopep8,
		},
		json = {
			require("formatter.filetypes.json").jq,
		},
		cmake = {
			require("formatter.filetypes.cmake").cmakeformat,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		latex = {
			require("formatter.filetypes.latex").latexindent,
		},
		["*"] = {
			util.copyf(defaults.prettier),
		},
	},
}
