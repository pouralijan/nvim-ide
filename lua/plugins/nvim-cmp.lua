local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    -- "hrsh7th/cmp-nvim-lua",
    -- "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "rafamaddriz/friendly-snippets"

    -- "windwp/nvim-autopairs",
  },
  opts = function()
    return require("plugins.configs.cmp")
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
}

return M
