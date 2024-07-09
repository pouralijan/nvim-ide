local lsp = function()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_get_option_value("filetype", {})
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

local actived_venv = function()
	local filetype = vim.api.nvim_get_option_value("filetype", {})
	if filetype == "python" then
		local venv_name = require("venv-selector").get_active_venv()
		if venv_name ~= nil then
			return string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "(poetry) ")
		else
			return "venv"
		end
	end
	return ""
end

local options = {
	theme = "auto",
	disabled_filetypes = { "packer", "NvimTree", "neo-tree", "__FLUTTER_DEV_LOG__", "log" },
	ignore_focus = {},

	always_divide_middle = false,
	globalstatus = false,
	icons_enabled = true,
	component_separators = "",
	section_separators = { left = "", right = "" },
}

local lazy_status = require("lazy.status")
local sections = {
	lualine_a = {
		{
			"mode",
			separator = { left = "" },
			right_padding = 2,
			icons_enabled = true,
		},
	},
	lualine_b = {
		{
			"filename",
		},
		{
			lsp,
			icon = " LSP:",
			separator = { right = "", left = "" },
		},
		{
			"diagnostics",
		},
		{ actived_venv, separator = { right = "", left = "" } },
	},
	lualine_c = {},
	lualine_x = {
		{ lazy_status.updates, cond = lazy_status.has_updates, color = { fg = "#ff9e64" } },
	},
	lualine_y = {
		{ "filesize" },
		{ "filetype" },
		{ "encoding" },
		{ "fileformat" },
		{ "progress" },
	},
	lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
}
local winbar = {
	lualine_a = { { "hostname", separator = { left = "" }, right_padding = 2 } },
	lualine_b = {
		{
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path},
		},
	},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {
		{
			"branch",
			separator = { left = "" },
		},
		{
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
		},
	},
	lualine_z = { { "tabs", separator = { left = "", right = "" }, left_padding = 2 } },
}
local tabline = {
	lualine_a = {
		{
			"buffers",
			separator = { right = "", left = "" },
			right_padding = 2,
		},
	},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}

local inactive_winbar = {
	lualine_a = {
		{
			"buffers",
			separator = { right = "", left = "" },
			right_padding = 2,
		},
	},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}
local myopts = {
	options = options,
	sections = sections,
	tabline = tabline,
	winbar = winbar,
	inactive_winbar = inactive_winbar,
}

return {
	lazy = false,
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = myopts,

	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
