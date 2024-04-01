local lsp = function()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
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

local options = {
	theme = "auto",
	disabled_filetypes = { "packer", "NvimTree", "neo-tree" },
	ignore_focus = {},
	always_divide_middle = true,
	globalstatus = false,
	icons_enabled = true,
	component_separators = "",
	section_separators = { left = "", right = "" },
}
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
	},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {
		{ "filesize" },
		{ "filetype" },
		{ "encoding" },
		{ "fileformat" },
		{ "progress" },
	},
	lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
}
local tabline = {
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
local winbar = {
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
