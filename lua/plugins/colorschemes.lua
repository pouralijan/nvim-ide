local M = {
{
  "lunarvim/darkplus.nvim",
  lazy = false,
	priority = 9999,
	config = function()
		vim.cmd('colorscheme darkplus')
	end
},
{
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 9999,
	config = function()
		vim.cmd('colorscheme nightfox')
	end
}
}

return M
