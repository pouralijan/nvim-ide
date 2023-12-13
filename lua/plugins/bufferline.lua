return {
  lazy = false,
  "akinsho/bufferline.nvim",
  config = function()
      require("plugins.configs.bufferline").setup()
  end,
  event = "User FileOpened",
}
