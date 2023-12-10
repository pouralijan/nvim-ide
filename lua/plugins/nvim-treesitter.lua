local options = {
  ensure_installed = {
    "lua",
    "python",
    "rust",
    "cpp",
  },
  sync_install = false,
  additional_vim_regex_highlighting = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

return {
	"folke/which-key.nvim",
  lazy = false,
  opts = options,
  -- init = function()
  --   require("core.utils").lazy_load "nvim-treesitter"
  -- end,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function(_, opts)
    -- dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)
  end,

  dependencies = {
    {
      "p00f/nvim-ts-rainbow"
    },
  },
}
