local nvim_keymap = vim.api.nvim_set_keymap

local M = {}

local extend_table = function(table, options)
	return vim.tbl_extend("force", table, options)
end

local MyMap = function(mode, lhs, rhs, desc, opts)
	-- Modes
	--    normal_mode = "n"
	--    insert_mode = "i"
	--    visual_mode = "v"
	--    visual_block_mode = "x"
	--    term_mode = "t"
	--    command_mode = "c"
	local options = { noremap = true, silent = true }
	if opts then
		options = extend_table(options, opts)
	end
	if desc then
		options = extend_table(options, { desc = desc })
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

M.MyMap = MyMap

-- Remap space as leadder key
MyMap("", "<Space>", "Nop")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
-- Pane Navigation
MyMap("n", "<C-h>", "<C-w>h", "Navigate Left Pane")
MyMap("n", "<C-j>", "<C-w>j", "Navigate Down Pane")
MyMap("n", "<C-k>", "<C-w>k", "Navigate Up Pane")
MyMap("n", "<C-l>", "<C-w>l", "Navigate Right Pane")
-- Pane Resize
MyMap("n", "<leader>rh", ":vertical resize +2<CR>", "Resize Left")
MyMap("n", "<leader>rj", ":resize -2<CR>", "Resize Down")
MyMap("n", "<leader>rk", ":resize +2<CR>", "Resize Up")
MyMap("n", "<leader>rl", ":vertical resize -2<CR>", "Resize Right")

MyMap("n", "<C-Left>", ":vertical resize +2<CR>", "Resize Left")
MyMap("n", "<C-Down>", ":resize -2<CR>", "Resize Down")
MyMap("n", "<C-UP>", ":resize +2<CR>", "Resize Up")
MyMap("n", "<C-Right>", ":vertical resize -2<CR>", "Resize Right")

-- Indenting
MyMap("v", "<", "<gv")
MyMap("v", ">", ">gv")

-- Window Management
MyMap("n", "<leader>sv", ":vsplit<CR>", "Split Vertically")
MyMap("n", "<leader>sh", ":split<CR>", "Split Horizontally")
MyMap("n", "<leader>sm", ":MaximizerToggle<CR>", "Toggle Maximize ???")

-- Move text up and down
MyMap("v", "<A-j>", ":m .+1<CR>==")
MyMap("v", "<A-k>", ":m .-1<CR>==")
MyMap("v", "p", '"_dP')

-- Buffer
MyMap("n", "<M-h>", ":bprev <CR>", "Navigate Prev Buffer")
MyMap("n", "<M-j>", ":bfirst <CR>", "Navigate Firest Buffer")
MyMap("n", "<M-k>", ":blast <CR>", "Navigate Last Buffer")
MyMap("n", "<M-l>", ":bnext <CR>", "Navigate Next Buffer")
MyMap("n", "<M-x>", function()
	require("plugins.configs.bufferline").buf_kill("bd", nil, false)
end, "Navigate Next Buffer")

-- more good
MyMap({ "n", "o", "x" }, "<s-h>", "^", "Move end of line")
MyMap({ "n", "o", "x" }, "<s-l>", "g_", "Move start of line")

-- Plugins

-- AutoFormat
MyMap("n", "<leader>af", ":FormatWrite", "Auto Formate")

MyMap("n", "<leader>vp", function()
	require("swenv.api").pick_venv()
end, "Pick python virtual env")
-- Directory Navigation
-- neo-tree
MyMap("n", "<C-e>", ":Neotree toggle<CR>", "Toggle nvimtree")
MyMap("n", "<leader>e", ":Neotree focus<CR>", "Focus nvimtree")
MyMap("n", "<leader>et", ":Neotree toggle<CR>")

-- whichkey
--"Which-key all keymaps",
MyMap("n", "<leader>", function()
	vim.cmd("WhichKey")
end)
MyMap("n", "<leader> ", function()
	vim.cmd("WhichKey")
end)
-- "Which-key query lookup",
MyMap("n", "<leader>wk", function()
	local input = vim.fn.input("WhichKey: ")
	vim.cmd("WhichKey " .. input)
end, "WhichKey input")

-- M.comment = function ()
--   -- Comments
--   keymap.set("n", "<C-_>", "gcc", { noremap = false })
--   keymap.set("v", "<C-_>", "gcc", { noremap = false })
-- end
-- Comments
nvim_keymap("n", "<C-_>", "gcc", { noremap = false })
nvim_keymap("v", "<C-_>", "gcc", { noremap = false })
-- MyMap("n", "<C-_>", "gcc")
-- MyMap("v", "<C-_>", "gcc")

-- Telescope
-- local telescope_builtin = require('telescope.builtin')
MyMap("n", "<leader>ta", ":Telescope")
-- MyMap("n", "<leader>fk", telescope_builtin.keymaps)
MyMap("n", "<leader>th", ":Telescope help_tags<CR>")
-- Telescope
-- find
MyMap("n", "<leader>tf", "<cmd> Telescope find_files <CR>", "Find files")
MyMap("n", "<leader>ts", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all")
MyMap("n", "<leader>tl", "<cmd> Telescope live_grep <CR>", "Live grep")
MyMap("n", "<leader>tb", "<cmd> Telescope buffers <CR>", "Find buffers")
MyMap("n", "<leader>th", "<cmd> Telescope help_tags <CR>", "Help page")
MyMap("n", "<leader>to", "<cmd> Telescope oldfiles <CR>", "Find oldfiles")
MyMap("n", "<leader>tz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer")

-- Telescope
-- git
MyMap("n", "<leader>tgm", "<cmd> Telescope git_commits <CR>", "show Git commits")
MyMap("n", "<leader>tgt", "<cmd> Telescope git_status <CR>", "Git status")

MyMap("n", "<leader>tgl", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	lazygit:toggle()
end, "Lazy Git")

-- Telescope
-- pick a hidden term
MyMap("n", "<leader>tt", "<cmd> Telescope toggleterm_manager <CR>", "Pick hidden term")

-- Telescope
-- theme switcher
MyMap("n", "<leader>ttc", "<cmd> Telescope themes <CR>", "Telescope themes")

MyMap("n", "<leader>tm", "<cmd> Telescope marks <CR>", "Telescope bookmarks")

local actions = require("telescope.actions")

M.telescope = {
	i = {
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,

		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,

		["<C-c>"] = actions.close,

		["<Down>"] = actions.move_selection_next,
		["<Up>"] = actions.move_selection_previous,

		["<CR>"] = actions.select_default,
		["<C-x>"] = actions.select_horizontal,
		["<C-v>"] = actions.select_vertical,
		["<C-t>"] = actions.select_tab,

		["<C-u>"] = actions.preview_scrolling_up,
		["<C-d>"] = actions.preview_scrolling_down,

		["<PageUp>"] = actions.results_scrolling_up,
		["<PageDown>"] = actions.results_scrolling_down,

		["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
		["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
		["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
		["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
		["<C-l>"] = actions.complete_tag,
		["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
	},

	n = {
		["<esc>"] = actions.close,
		["<CR>"] = actions.select_default,
		["<C-x>"] = actions.select_horizontal,
		["<C-v>"] = actions.select_vertical,
		["<C-t>"] = actions.select_tab,

		["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
		["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
		["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
		["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

		["j"] = actions.move_selection_next,
		["k"] = actions.move_selection_previous,
		["H"] = actions.move_to_top,
		["M"] = actions.move_to_middle,
		["L"] = actions.move_to_bottom,

		["<Down>"] = actions.move_selection_next,
		["<Up>"] = actions.move_selection_previous,
		["gg"] = actions.move_to_top,
		["G"] = actions.move_to_bottom,

		["<C-u>"] = actions.preview_scrolling_up,
		["<C-d>"] = actions.preview_scrolling_down,

		["<PageUp>"] = actions.results_scrolling_up,
		["<PageDown>"] = actions.results_scrolling_down,

		["?"] = actions.which_key,
	},
}

M.lsp_keymaps = function(buffnr)
	print("LSP keymap")
	local keymap_option = { buffer = buffnr }

	MyMap("n", "gD", function()
		vim.lsp.buf.declaration()
	end, "LSP declaration", keymap_option)
	MyMap("n", "gd", function()
		vim.lsp.buf.definition()
	end, "LSP definition", keymap_option)
	MyMap("n", "K", function()
		vim.lsp.buf.hover()
	end, "LSP hover", keymap_option)
	MyMap("n", "gi", function()
		vim.lsp.buf.implementation()
	end, "LSP implementation", keymap_option)
	MyMap("n", "<C-k>", function()
		vim.lsp.buf.signature_help()
	end, "LSP signature help", keymap_option)
	MyMap("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, "LSP rename buffer", keymap_option)
	MyMap("n", "gr", function()
		vim.lsp.buf.references()
	end, "LSP references", keymap_option)
	MyMap("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, "LSP code action", keymap_option)
	MyMap("n", "<leader>fx", function()
		vim.diagnostic.open_float()
	end, "Open Floating", keymap_option)
	MyMap("n", "gl", function()
		vim.diagnostic.open_float()
	end, "Floating diagnostic", keymap_option)
	MyMap("n", "[d", function()
		vim.diagnostic.goto_prev({ border = "rounded" })
	end, "Goto prev", keymap_option)
	MyMap("n", "]d", function()
		vim.diagnostic.goto_next({ border = "rounded" })
	end, "Goto next", keymap_option)
	MyMap("n", "<leader>q", function()
		vim.diagnostic.setloclist()
	end, "Diagnostic setloclist", keymap_option)
	MyMap("n", "<leader>D", function()
		vim.lsp.buf.type_definition()
	end, "LSP definition type", keymap_option)
	MyMap("n", "<leader>wa", function()
		vim.lsp.buf.add_workspace_folder()
	end, "Add workspace folder", keymap_option)
	MyMap("n", "<leader>wr", function()
		vim.lsp.buf.remove_workspace_folder()
	end, "Remove workspace folder", keymap_option)
	MyMap("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "List workspace folders", keymap_option)
	MyMap("v", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, "LSP code action", keymap_option)

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
	print("LSP keymap end")
end

return M
