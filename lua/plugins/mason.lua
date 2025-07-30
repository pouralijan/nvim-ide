require("plugins"):add("mason-org/mason.nvim", {
    "WhoIsSethDaniel/mason-tool-installer.nvim" })

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
local ensure_installed = {
    -- "bash-language-server",
    "clangd",
    "clang-format",
    "codelldb",
    "cpplint",
    "cpptools",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "editorconfig-checker",
    "jinja-lsp",
    "json-to-struct",
    "lua-language-server",
    "luacheck",
    "misspell",
    "nginx-language-server",
    "rust-analyzer",
    "revive",
    "ruff",
    "shellcheck",
    "shellcheck",
    "shfmt",
    "slint-lsp",
    "staticcheck",
    "stylua",
    "taplo",
    "vim-language-server",
    "vint",
    "yaml-language-server",
    "cmake-language-server",
}

require('mason-tool-installer').setup({
    ensure_installed = ensure_installed,
    auto_update = true,
})
