return {
  lazy = false,
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = require("plugins.configs.nvim-lualine"),
	config = function(_, opts)
    require("lualine").setup(opts)
	end,
}
