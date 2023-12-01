print("Handlers")
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
    -- disable virtual text
    virtual_text = false,
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
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(buffnr)
  local keymap = vim.keymap
  local opts = { buffer = buffnr, noremap = true, silent = true } -- { buffer = buffnr, desc = "vim.lsp.buf.hover" }
  keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts) -- "LSP declaration", },
  keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) --  ["gd"] = { function() vim.lsp.buf.definition() end, "LSP definition", },
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)--  ["K"] = { function() vim.lsp.buf.hover() end, "LSP hover", },
  keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)-- ["gi"] = { function() vim.lsp.buf.implementation() end, "LSP implementation", },
  keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts) -- ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "LSP signature help", },
  -- keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)-- ["gr"] = { function() vim.lsp.buf.references() end, "LSP references", },
  -- keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  -- keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts) --, "LSP code action", },
  -- keymap.set("n", "<leader>f", function() vim.diagnostic.open_float() end, opts)
  keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts) -- ["<leader>lf"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic", },
  keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts) -- "Goto prev", },
  keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts) -- "Goto next", },
  keymap.set("n", "<leader>q", function() vim.diagnostic.setloclist() end, opts) -- "Diagnostic setloclist", },
  keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)-- ["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "LSP definition type", },
  keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts) -- "Add workspace folder"
  keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts) --"Remove workspace folder"
  keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts) --"List workspace folders"

  keymap.set("v", "<leader>ca", function() vim.lsp.buf.code_action() end, opts) --"LSP code action"

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]


end

M.on_attach = function(client, bufnr)
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
  -- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

return M
