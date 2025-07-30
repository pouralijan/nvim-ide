-- Format on Save

local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd


augroup("__formatter__", { clear = true })

autocmd("InsertLeave", {
    group = "__formatter__",
    callback = function() vim.lsp.buf.format() end
})

-- augroup("filetypedetect", { clear = true })
-- autocmd({ "BufNewFile", "BufRead" }, {
--     group = "filetypedetect",
--     pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
--     command = "set filetype=yaml.docker-compose",
-- })

-- augroup("filetypedetect", { clear = true })
-- autocmd({ "BufNewFile", "BufRead" }, {
--   group = "filetypedetect",
--  pattern = "justfile",
--  command = "setfiletype make",
--})

--autocmd({ "BufNewFile", "BufRead" }, {
--  group = "filetypedetect",
--  pattern = "Makefile",
--  command = "setfiletype make",
--})
--
-- autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
-- 	group = "filetypedetect",
-- 	pattern = "*.slint",
-- 	command = "setlocal filetype=slint",
-- })

-- local lsp_attach = vim.api.nvim_create_augroup("lsp-attach", { clear = true })
-- local lsp_attch_callback = function(event)
-- 	local map = function(keys, func, desc)
-- 		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 	end
--
-- 	-- bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
-- 	map("gi", vim.lsp.buf.implementation, "Goto implementation")
--
-- 	map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
-- 	map("K", vim.lsp.buf.hover, "Hover Documentation")
-- 	map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
-- 	map("gD", vim.lsp.buf.declaration, "Goto Declaration")
-- 	map("gd", vim.lsp.buf.definition, "Goto Definition")
--
-- 	map("<leader>v", "<cmd>split | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Horizontally Split")
--
-- 	-- local wk = require("which-key")
-- 	-- wk.add({
-- 		-- { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
-- 		-- { "<leader>lA", vim.lsp.buf.range_code_action, desc = "Range Code Actions" },
-- 		-- { "<leader>ls", vim.lsp.buf.signature_help, desc = "Display Signature Information" },
-- 		-- { "<leader>lr", vim.lsp.buf.rename, desc = "Rename all references" },
-- 		-- { "<leader>lf", vim.lsp.buf.format, desc = "Format" },
-- 		-- { "<leader>lc", require("config.utils").copyFilePathAndLineNumber, desc = "Copy File Path and Line Number" },
-- 		-- { "<leader>Wa", vim.lsp.buf.add_workspace_folder, desc = "Workspace Add Folder" },
-- 		-- { "<leader>Wr", vim.lsp.buf.remove_workspace_folder, desc = "Workspace Remove Folder" },
-- 		-- {
-- 		-- 	"<leader>Wl",
-- 		-- 	function()
-- 		-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		-- 	end,
-- 		-- 	desc = "Workspace List Folders",
-- 		-- },
-- 	-- })
--
-- 	local function client_supports_method(client, method, bufnr)
-- 		if vim.fn.has("nvim-0.11") == 1 then
-- 			return client:supports_method(method, bufnr)
-- 		else
-- 			return client.supports_method(method, { bufnr = bufnr })
-- 		end
-- 	end
--
-- 	local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 	if
-- 		client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
-- 	then
-- 		local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
-- 		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 			buffer = event.buf,
-- 			group = highlight_augroup,
-- 			callback = vim.lsp.buf.document_highlight,
-- 		})
--
-- 		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 			buffer = event.buf,
-- 			group = highlight_augroup,
-- 			callback = vim.lsp.buf.clear_references,
-- 		})
--
-- 		vim.api.nvim_create_autocmd("LspDetach", {
-- 			group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
-- 			callback = function(event2)
-- 				vim.lsp.buf.clear_references()
-- 				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
-- 			end,
-- 		})
-- 	end
--
-- 	if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
-- 		map("<leader>th", function()
-- 			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
-- 		end, "[T]oggle Inlay [H]ints")
-- 	end
-- end
-- autocmd("LspAttach", { group = lsp_attach, callback = lsp_attch_callback })
-- local lsp = vim.api.nvim_create_augroup("lsp", { clear = true })
--
-- local lsp_attch_callback = function(event)
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--     if client:supports_method("textDocument/completion") then
--         -- vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
--     end
-- end
-- autocmd("LspAttach", { group = lsp, callback = lsp_attch_callback })
-- -- autocmd("LspAttach", { callback = lsp_attch_callback })
--
-- vim.cmd("set completeopt+=noselect")
