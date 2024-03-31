return {
	"MattesGroeger/vim-bookmarks",
	lazy = false,
	config = function()
		vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160]])
		vim.cmd([[highlight BookmarkLine ctermbg=194 ctermfg=NONE]])
		vim.g.bookmark_sign = "♥"
		vim.g.bookmark_highlight_lines = 1

	end,
	dependences = {
		"nvim-telescope/telescope.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
	},
}
