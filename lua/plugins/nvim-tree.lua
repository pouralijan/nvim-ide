return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]])
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
		})
	end,
}
