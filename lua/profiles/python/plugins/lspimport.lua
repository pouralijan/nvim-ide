return {
	"stevanmilic/nvim-lspimport",
	lazy = false,
	config = function(_, opts)
		local lspimport = require("lspimport")
		vim.keymap.set("n", "<leader>ai", lspimport.import, { noremap = true })
	end,
}
