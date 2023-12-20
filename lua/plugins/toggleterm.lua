local option = {
      open_mapping = [[<c-\>]],
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        boarder = "curved",
        winbled = 0,
        highlights = {
          boarder = "Normal",
          background = "Normal",
        },
      },
}
return {
  lazy = false,
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = option,
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end
}
