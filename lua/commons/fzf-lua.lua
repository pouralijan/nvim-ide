return {
	lazy = false,
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files in project directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep({ resume = true })
			end,
			desc = "Find by greping in project directory",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Resume last FzfLua",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find nvim config file.",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Find nvim config file.",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[f][k]eymaps.",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[f]ind current [w]ord.",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[f]ind current [W]ord.",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[f]ind [d]iagnostics.",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[f]ind [o]ld files.",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[f]ind [b]uffers.",
		},
		{
			"<leader>f/",
			function()
				require("fzf-lua").lgrep_curbus()
			end,
			desc = "[f][/] Live grep the current buffer.",
		},
		-- =============== LSP
		{
			"<leader>lr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "[l]sp [r]eferences.",
		},
		{
			"<leader>ld",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "[l]sp [d]efinitionsl.",
		},
		{
			"<leader>lD",
			function()
				require("fzf-lua").lsp_declarations()
			end,
			desc = "[l]sp [D]eclarations.",
		},
		{
			"<leader>lt",
			function()
				require("fzf-lua").lsp_typedefs()
			end,
			desc = "[l]sp [t]ypedefs.",
		},
		{
			"<leader>li",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "[l]sp [i]mplementations.",
		},
		{
			"<leader>ls",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "[l]sp document [s]ymbols.",
		},
		{
			"<leader>lsw",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "[l]sp [s]ymbols of [w]orkspace .",
		},
		{
			"<leader>lsl",
			function()
				require("fzf-lua").lsp_live_workspace_symbols()
			end,
			desc = "[l]sp [s]ymbols of [l]ive workspace .",
		},
		{
			"<leader>lci",
			function()
				require("fzf-lua").lsp_incoming_calls()
			end,
			desc = "[l]sp [c]alls [i]ncoming.",
		},
		{
			"<leader>lco",
			function()
				require("fzf-lua").lsp_outgoing_calls()
			end,
			desc = "[l]sp [c]alls [o]utgoing.",
		},
		{
			"<leader>lca",
			function()
				require("fzf-lua").lsp_code_actions()
			end,
			desc = "[l]sp [c]ode [a]ctions.",
		},
		{
			"<leader>lf",
			function()
				require("fzf-lua").lsp_finder()
			end,
			desc = "[l]sp [f]ind. All LSP locations, combined view.",
		},
		{
			"<leader>ldd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[l]sp [d]iagnostics document.",
		},
		{
			"<leader>ldw",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "[l]sp [d]iagnostics workspace.",
		},
	},
}
