local M = {
  "williamboman/mason.nvim",
  lasy = false,
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  init = function()
     require("plugins.configs.mason")
     require("plugins.configs.lsp.handlers").setup()
  end,
}



return M
