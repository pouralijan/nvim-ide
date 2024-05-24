return {
	"tomasky/bookmarks.nvim",
	lazy = false,
	-- after = "telescope.nvim",
	event = "VimEnter",
	opts = {
		save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
		keywords = {
			["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
			["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
			["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
			["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
		},
		on_attach = function(bufnr)
			local bm = require("bookmarks")
			local map = vim.keymap.set
			map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
			map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
			map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
			map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
			map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
			map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
			map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
		end,
	},
	config = function(_, opts)
		require("bookmarks").setup(opts)
	end,
}

-- return {
--     'crusj/bookmarks.nvim',
--     keys = {
--         { "<tab><tab>", mode = { "n" } },
--     },
--     branch = 'main',
--     dependencies = { 'nvim-web-devicons' },
--     config = function()
--         require("bookmarks").setup()
--         require("telescope").load_extension("bookmarks")
--     end
-- }

-- return {
-- 	"MattesGroeger/vim-bookmarks",
-- 	lazy = false,
-- 	config = function()
-- 		vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160]])
-- 		vim.cmd([[highlight BookmarkLine ctermbg=194 ctermfg=NONE]])
-- 		vim.g.bookmark_sign = "♥"
-- 		vim.g.bookmark_highlight_lines = 1
-- 	end,
-- 	dependences = {
-- 		"nvim-telescope/telescope.nvim",
-- 		"tom-anders/telescope-vim-bookmarks.nvim",
-- 	},
-- }
