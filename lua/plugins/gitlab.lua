return {
	"harrisoncramer/gitlab.nvim",
	lazy = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
		"nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
	},
	enabled = true,
	build = function()
		require("gitlab.server").build(true)
	end, -- Builds the Go binary
	-- options = {
		-- config_path = "~/.gitlab.nvim",
	-- },
	config = function(_, opts)
		require("gitlab").setup(opts)

		local gitlab = require("gitlab")
		local gitlab_server = require("gitlab.server")
		vim.keymap.set("n", "<leader>gllb", gitlab.choose_merge_request)
		vim.keymap.set("n", "<leader>gllr", gitlab.review)
		vim.keymap.set("n", "<leader>glls", gitlab.summary)
		vim.keymap.set("n", "<leader>gllA", gitlab.approve)
		vim.keymap.set("n", "<leader>gllR", gitlab.revoke)
		vim.keymap.set("n", "<leader>gllc", gitlab.create_comment)
		vim.keymap.set("v", "<leader>gllc", gitlab.create_multiline_comment)
		vim.keymap.set("v", "<leader>gllC", gitlab.create_comment_suggestion)
		vim.keymap.set("n", "<leader>gllO", gitlab.create_mr)
		vim.keymap.set("n", "<leader>gllm", gitlab.move_to_discussion_tree_from_diagnostic)
		vim.keymap.set("n", "<leader>glln", gitlab.create_note)
		vim.keymap.set("n", "<leader>glld", gitlab.toggle_discussions)
		vim.keymap.set("n", "<leader>gllaa", gitlab.add_assignee)
		vim.keymap.set("n", "<leader>gllad", gitlab.delete_assignee)
		vim.keymap.set("n", "<leader>gllla", gitlab.add_label)
		vim.keymap.set("n", "<leader>gllld", gitlab.delete_label)
		vim.keymap.set("n", "<leader>gllra", gitlab.add_reviewer)
		vim.keymap.set("n", "<leader>gllrd", gitlab.delete_reviewer)
		vim.keymap.set("n", "<leader>gllp", gitlab.pipeline)
		vim.keymap.set("n", "<leader>gllo", gitlab.open_in_browser)
		vim.keymap.set("n", "<leader>gllM", gitlab.merge)
		vim.keymap.set("n", "<leader>gllu", gitlab.copy_mr_url)
		vim.keymap.set("n", "<leader>gllP", gitlab.publish_all_drafts)
		vim.keymap.set("n", "<leader>gllD", gitlab.toggle_draft_mode)
	end,
}
