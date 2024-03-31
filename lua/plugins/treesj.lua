return {
  lazy=false,
	"Wansmer/treesj",
	-- keys = { "<space>m", "<space>j", "<space>s" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")
		treesj.setup({
			-- use_default_keymaps = true,
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>jt", function()
			treesj.toggle()
		end)
		keymap.set("n", "<leader>js", function()
			treesj.toggle({ split = { recursive = true } })
		end)
	end,
}
