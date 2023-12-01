local M = {
  "williamboman/mason.nvim",
  lasy = false,
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  -- config = {
  --   ui = {
  --       icons = {
  --           package_installed = "✓",
  --           package_pending = "➜",
  --           package_uninstalled = "✗"
  --       }
  --   },
  -- opts = function()
  --     return require("plugins.configs.mason")
  -- end,
  init = function()
     require("plugins.configs.mason")
     require("plugins.configs.lsp.handlers").setup()
  end,
}



return M
