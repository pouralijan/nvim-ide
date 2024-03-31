return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	config = function()
		local todo_comments = require("todo-comments")
		local telescop = require("telescope")
		todo_comments.setup()

		vim.keymap.set("n", "<leader>td]", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "<leader>td[", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		vim.keymap.set("n", "<leader>tdq", "<cmd>TodoQuickFix<CR> ", { desc = "todo comment quick fix" })
		vim.keymap.set("n", "<leader>tdo", "<cmd>TodoLocList<CR> ", { desc = "todo comment local list" })

		vim.keymap.set("n", "<leader>tdl", "<cmd>TodoTelescope<CR> ", { desc = "todo comment list" })
		vim.keymap.set("n", "<leader>tdt", "<cmd>TodoTrouble<CR> ", { desc = "todo comment trouble" })
	end,
}
