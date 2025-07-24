-- local current_profile = require("core.profile").get_current_profile()
-- local ok, profile = pcall(require, "profiles." .. current_profile .. ".init")
-- print("ProfileName: " .. profile.name)
-- if ok then
-- 	print(profile.lsp)
-- 	for index, value in pairs(profile.lsp) do
-- 		print("Lsp: " .. index)
-- 		vim.lsp.config(index, value)
-- 		vim.lsp.enable(index)
-- 	end
-- end

local signs = {
	text = {
		[vim.diagnostic.severity.ERROR] = "󰅚 ",
		[vim.diagnostic.severity.WARN] = "󰀪 ",
		[vim.diagnostic.severity.INFO] = "󰋽 ",
		[vim.diagnostic.severity.HINT] = "󰌶 ",
	},
	numhl = {
		[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		[vim.diagnostic.severity.WARN] = "WarningMsg",
	},
}

vim.diagnostic.config({
	-- virtual text a feature that show lint error on screen.
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		-- focusable = false,
		-- style = "minimal",
		border = "rounded",
		source = true,
		-- header = "",
		-- prefix = "",
	},
	-- show signs
	signs = {
		active = signs,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
