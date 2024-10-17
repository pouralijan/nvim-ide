local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- virtual text a feature that show lint error on screen.
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec2(
			[[
	     augroup lsp_document_highlight
	       autocmd! * <buffer>
	       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	     augroup END
	   ]],
			{}
		)
	end
end

M.on_attach = function(client, bufnr)
	-- client.server_capabilities.documentFormattingProvider = false
	-- client.server_capabilities.documentRangeFormattingProvider = false
	-- lsp_keymaps(bufnr)
	-- client.server_capabilities.completionProvider = true
	-- client.server_capabilities.hoverProvider = false
	-- client.server_capabilities.definitionProvider = false
	-- client.server_capabilities.rename = false
	-- client.server_capabilities.signature_help = false

	-- lsp_highlight_document(client)
	return require("core.keymaps").lsp_keymaps(client, bufnr)
end

-- M.capabilities = {}
-- local lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if lsp_status_ok then
-- 	M.capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 	-- M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- end
local status_ok, cmp_nvim = pcall(require, "cmp_nvim")

if status_ok then
	M.capabilities = cmp_nvim.default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- M.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local lspconfig = require("lspconfig")
	lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
		-- Required by nvim-cmp
		capabilities = M.capabilities,
	})
end

return M
