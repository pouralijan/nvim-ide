local function get_attached_clients()
	-- Get active clients for current buffer
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return "No client active"
	end
	local buf_ft = vim.bo.filetype
	local buf_client_names = {}
	local num_client_names = #buf_client_names

	-- Add lsp-clients active in the current buffer
	for _, client in pairs(buf_clients) do
		num_client_names = num_client_names + 1
		buf_client_names[num_client_names] = client.name
	end

	-- Add linters for the current filetype (nvim-lint)
	local lint_success, lint = pcall(require, "lint")
	if lint_success then
		for ft, ft_linters in pairs(lint.linters_by_ft) do
			if ft == buf_ft then
				if type(ft_linters) == "table" then
					for _, linter in pairs(ft_linters) do
						num_client_names = num_client_names + 1
						buf_client_names[num_client_names] = linter
					end
				else
					num_client_names = num_client_names + 1
					buf_client_names[num_client_names] = ft_linters
				end
			end
		end
	end

	-- Add formatters (conform.nvim)
	local conform_success, conform = pcall(require, "conform")
	if conform_success then
		for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
			if formatter then
				num_client_names = num_client_names + 1
				buf_client_names[num_client_names] = formatter
			end
		end
	end
	local formatter_f, _ = pcall(require, "formatter")

	if formatter_f then
		local formatter_util = require("formatter.util")
		for _, _formatter in ipairs(formatter_util.get_available_formatters_for_ft(0)) do
			num_client_names = num_client_names + 1
			buf_client_names[num_client_names] = _formatter
		end
	end

	local client_names_str = table.concat(buf_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end
local formatter = function()
	local formatter_s, _ = pcall(require, "formatter")
	local msg = "No Active formater"

	if formatter_s then
		local formatter_util = require("formatter.util")
		local buf_ft = vim.bo.filetype
		for _, _formatter in ipairs(formatter_util.get_available_formatters_for_ft(buf_ft)) do
			for a, b in ipairs(_formatter) do
				-- vim.notify(a)
				vim.notify(b)
				return b
			end
			return _formatter
		end
	end
	return msg
end

local lsp = function()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_get_option_value("filetype", {})
	local clients = vim.lsp.get_clients()
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
	disabled_filetypes = {
		"packer",
		"NvimTree",
		"neo-tree",
		"__FLUTTER_DEV_LOG__",
		"log",
		"trouble",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dapui_console",
		"dap-repl",
	},
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
