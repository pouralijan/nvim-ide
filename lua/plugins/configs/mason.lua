local servers = {
	"lua_ls",
	"pyright",
	"clangd",
	"rust_analyzer",
	"bashls",
	"taplo",
	"cmake",
	"jqls",
	"jsonls",
	"tsserver",
	"marksman",
	"prettier",
	"grammarly",
	"gradle_ls",
	"prismals",
	"texlab",
	"ltex",
	"dartls",
	"black",
	"dockerls",
	"docker_compose_language_service",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("Error : lspconfig not found.")
	return
end

local opts = {}

for _, server in pairs(servers) do
	-- local signature = require("lsp_signature")
	opts = {
		on_attach = require("plugins.configs.lsp.handlers").on_attach,
		-- on_attach = require("core.keymaps").lsp_keymaps,

		-- on_attach = signature.on_attach({
		-- 	bind = true,
		-- 	handler_opts = {
		-- 		border = "single",
		-- 	},
		-- }),

		capabilities = require("plugins.configs.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "plugins.configs.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	-- server = server:gsub("-", "_")
	-- print(server)
	lspconfig[server].setup(opts)
end
