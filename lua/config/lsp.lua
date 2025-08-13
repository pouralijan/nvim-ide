local M = {}

M.lsp = {
    "lua_ls",
    "ruff",
    "pyright",
    "jinja_lsp",
    -- "black",
    -- "pylsp",
    "nginx_language_server",
    "yamlls",
    "bashls",
    "taplo",
    "dockerls",
    "docker_compose_language_service",
    "clangd",
    "rust_analyzer",
    "cmake",
    "ts_ls",
    "gitlab_ci_ls",
    "buf_ls",
}

-- M.capabilities = {}
-- vim.lsp.config('*', {
--   capabilities = {
--     textDocument = {
--       semanticTokens = {
--         multilineTokenSupport = true,
--       }
--     }
--   },
--   root_markers = { '.git' },
-- })

vim.lsp.enable(M.lsp)
