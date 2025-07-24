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

M.load_mapping = function(keymap_table)
	for mode, mode_value in pairs(keymap_table) do
		for keybind, mapping_info in pairs(mode_value) do
			local action = mapping_info[1] or {}
			local desc = mapping_info[2] or {}
			local opts = mapping_info[3] or {}
			MyMap(mode, keybind, action, desc, opts)
		end
	end
end

M.MyMap = MyMap
MyMap("", "<Space>", "Nop")

M.set_mapleader = function()
	-- Remap space as leadder key
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"
	vim.g.maplocalleader = "\\"
end

M.set_mapleader()
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
MyMap("n", "gT", ":bprev <CR>", "Navigate Prev Buffer")
MyMap("n", "<M-h>", ":bprev <CR>", "Navigate Prev Buffer")
MyMap("n", "<M-j>", ":bfirst <CR>", "Navigate Firest Buffer")
MyMap("n", "<M-k>", ":blast <CR>", "Navigate Last Buffer")
MyMap("n", "<M-l>", ":bnext <CR>", "Navigate Next Buffer")
MyMap("n", "gt", ":bnext <CR>", "Navigate Next Buffer")
MyMap("n", "<M-x>", ":bd <CR>", "Kill cueernt Buffer")

-- more good
MyMap({ "n", "o", "x" }, "<s-h>", "^", "Move end of line")
MyMap({ "n", "o", "x" }, "<s-l>", "g_", "Move start of line")

-- Plugins
--
-- Oil
MyMap("n", "-", "<CMD>Oil<CR>", "Open parent directory")

MyMap("n", "<leader>fb", function()
	require("flutter-bloc").create_bloc()
end, "Create flutter bloc")

MyMap("n", "<leader>fc", function()
	require("flutter-bloc").create_cubit()
end, "Create flutter cubit")

vim.keymap.set(
	"n",
	"<Leader>cfc",
	"<cmd>lua require('flutter-bloc').create_cubit()<cr>",
	{ desc = "[C]reate [F]lutter [C]ubit" }
)

-- AutoFormat
MyMap("n", "<leader>af", ":FormatWrite<CR>", "Auto Formate")

-- ???
MyMap("n", "<leader>vp", function()
	require("swenv.api").pick_venv()
end, "Pick python virtual env")
-- Directory Navigation
-- neo-tree
MyMap("n", "<C-e>", ":Neotree toggle<CR>", "Toggle nvimtree")
MyMap("n", "<leader>e", ":Neotree filesystem reveal left<CR>", "Focus nvimtree")
MyMap("n", "<leader>et", ":Neotree toggle<CR>")
MyMap("n", "<leader>ef", ":Neotree filesystem reveal float<CR>")

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

-- Trouble
MyMap("n", "<leader>xx", function()
	require("trouble").toggle()
end, "Troble workspace diagnostics")
-- MyMap("n", "<leader>xw", function()
-- 	require("trouble").toggle("workspace_diagnostics")
-- end, "Troble workspace diagnostics")
--
MyMap("n", "<leader>xw", "<cmd> Trouble diagnostics toggle <cr>", "Troble workspace diagnostics")

MyMap("n", "<leader>xd", "<cmd> Trouble diagnostics toggle focus=true filter.buf=0 <cr>", "Troble document diagnostics")

MyMap("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", "Troble document symbols")

-- MyMap("n", "<leader>xq", function()
-- 	require("trouble").toggle("quickfix")
-- end, "Troble quickfix")
MyMap("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", "Troble quickfix")

-- MyMap("n", "<leader>xl", function()
-- 	require("trouble").toggle("loclist")
-- end, "Troble loclist")
MyMap("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", "Troble loclist")

-- MyMap("n", "gr", function()
-- 	require("trouble").toggle("lsp_references")
-- end, "Troble lsp_references")
MyMap("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=true<cr>", "Troble lsp_references")

-- MyMap("n", "<leader>gl", function()
-- 	local Terminal = require("toggleterm.terminal").Terminal
-- 	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
-- 	lazygit:toggle()
-- end, "Lazy Git")

MyMap("n", "<leader>ghp", "<cmd> Gitsigns preview_hunk <CR>", "Git preview hunk")
MyMap("n", "<leader>gh", "<cmd> Gitsigns preview_hunk_inline <CR>", "Git preview hunk inline")
MyMap("n", "<leader>gn", "<cmd> Gitsigns next_hunk <CR>", "Git next_hunk")
MyMap("n", "<leader>gp", "<cmd> Gitsigns prev_hunk <CR>", "Git prev_hunk")
MyMap("n", "<leader>gtl", "<cmd> Gitsigns toggle_linehl<CR>", "Git toggleline hilight")
MyMap("n", "<leader>gtw", "<cmd> Gitsigns toggle_word_diff<CR>", "Git toggle word diff")
MyMap("n", "<leader>gtn", "<cmd> Gitsigns toggle_numhl<CR>", "Git toggle number hilight ")

MyMap("n", "<leader>dgl", "<cmd> diffget LO<CR>", "Diff get local")
MyMap("n", "<leader>dgr", "<cmd> diffget RE<CR>", "Diff get remote")

-- Rest
M.rest = {
	n = {
		["<leader>ro"] = {
			"<cmd>Rest open<cr>",
			-- function()
			-- 	local rest = require("rest-nvim")
			-- 	rest.open()
			-- end,
			"Open result pane",
		},
		["<leader>rr"] = {
			"<cmd>Rest run<cr>",
			-- function()
			-- 	local rest = require("rest-nvim")
			-- 	rest.run()
			-- end,
			"Run request under the cursor",
		},
		["<leader>rl"] = {
			"<cmd>Rest last<cr>",
			-- function()
			-- 	local rest = require("rest-nvim")
			-- 	rest.last()
			-- end,
			"Run last request",
		},
	},
}

-- function M.lsp_keymaps(client, bufnr)
-- M.lsp_keymaps = function(client, bufnr)
-- 	local keymap_option = { noremap = true, silent = true, buffer = bufnr }
-- 	MyMap("n", "gD", function()
-- 		vim.lsp.buf.declaration()
-- 	end, "LSP declaration", keymap_option)
-- 	MyMap("n", "gd", function()
-- 		vim.lsp.buf.definition()
-- 	end, "LSP definition", keymap_option)
-- 	MyMap("n", "<leader>lD", function()
-- 		vim.lsp.buf.type_definition()
-- 	end, "LSP definition type", keymap_option)
-- 	MyMap("n", "K", function()
-- 		vim.lsp.buf.hover()
-- 	end, "LSP hover", keymap_option)
-- 	MyMap("n", "gi", function()
-- 		vim.lsp.buf.implementation()
-- 	end, "LSP implementation", keymap_option)
-- 	MyMap("n", "<C-k>", function()
-- 		vim.lsp.buf.signature_help()
-- 	end, "LSP signature help", keymap_option)
-- 	MyMap("n", "<leader>rn", function()
-- 		vim.lsp.buf.rename()
-- 	end, "LSP rename buffer", keymap_option)
-- 	MyMap("n", "<leader>ca", function()
-- 		vim.lsp.buf.code_action()
-- 	end, "LSP code action", keymap_option)
-- 	MyMap("n", "<leader>fx", function()
-- 		vim.diagnostic.open_float()
-- 	end, "Open Floating", keymap_option)
-- 	MyMap("n", "gl", function()
-- 		vim.diagnostic.open_float()
-- 	end, "Floating diagnostic", keymap_option)
-- 	MyMap("n", "[d", function()
-- 		vim.diagnostic.goto_prev({ border = "rounded" })
-- 	end, "Goto prev", keymap_option)
-- 	MyMap("n", "]d", function()
-- 		vim.diagnostic.goto_next({ border = "rounded" })
-- 	end, "Goto next", keymap_option)
-- 	MyMap("n", "<leader>q", function()
-- 		vim.diagnostic.setloclist()
-- 	end, "Diagnostic setloclist", keymap_option)
-- 	MyMap("n", "<leader>wa", function()
-- 		vim.lsp.buf.add_workspace_folder()
-- 	end, "Add workspace folder", keymap_option)
-- 	MyMap("n", "<leader>wr", function()
-- 		vim.lsp.buf.remove_workspace_folder()
-- 	end, "Remove workspace folder", keymap_option)
-- 	MyMap("n", "<leader>wl", function()
-- 		vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
-- 	end, "List workspace folders", keymap_option)
-- 	-- MyMap("v", "<leader>ca", function()
-- 	-- 	vim.lsp.buf.code_action()
-- 	-- end, "LSP code action", keymap_option)
--
-- 	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
-- end

M.ufo = function()
	--     vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
	-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
	-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
	-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
	-- vim.keymap.set('n', 'K', function()
	--     local winid = require('ufo').peekFoldedLinesUnderCursor()
	--     if not winid then
	--         -- choose one of coc.nvim and nvim lsp
	--         vim.fn.CocActionAsync('definitionHover') -- coc.nvim
	--         vim.lsp.buf.hover()
	--     end
	local ufo = require("ufo")
	local dap_keys = {
		n = {
			["zR"] = {
				ufo.openAllFolds,
				"Open All folds with UFO",
			},
			["zM"] = {
				ufo.closeAllFolds,
				"Close All folds with UFO",
			},
			["zr"] = {
				ufo.openFoldsExceptKinds,
				"Open All folds Expect kinds with UFO",
			},
		},
	}
	M.load_mapping(dap_keys)
end

M.dap = function()
	-- DAP
	local dap = require("dap")
	local dapui = require("dapui")
	local dap_projects = require("nvim-dap-projects")
	local dap_keys = {
		n = {
			["<leader>db"] = {
				dap.toggle_breakpoint,
				"Add breakpoing at line",
			},
			["<leader>dc"] = {
				dap.run_to_cursor,
				"Run to cursor",
			},
			["<leader>d?"] = {
				function()
					dapui.eval(nil, { enter = true })
				end,
				"Eval var under cursor",
			},

			["<leader>dut"] = {
				dapui.toggle,
				"Start or continue the debuger",
			},
			["<F5>"] = {
				dap.continue,
				"Start or continue the debuger",
			},
			["<F10>"] = {
				dap.step_over,
				"DAP Step Over",
			},
			["<leader>dn"] = {
				dap.step_over,
				"DAP Step Over",
			},
			["<F11>"] = {
				dap.step_into,
				"DAP Step Into",
			},
			["<leader>di"] = {
				dap.step_into,
				"DAP Step Into",
			},
			["<F12>"] = {
				dap.step_out,
				"DAP Step Out",
			},
			["<leader>do"] = {
				dap.step_out,
				"DAP Stop Out",
			},
			["<F9>"] = {
				dap.step_back,
				"DAP Step Back",
			},
			["<leader>dp"] = {
				dap.step_back,
				"DAP Stop Back",
			},
			["<F8>"] = {
				dap.restart,
				"DAP Restart",
			},
			["<leader>dr"] = {
				dap.restart,
				"DAP Restart",
			},
		},
	}
	M.load_mapping(dap_keys)
end

return M
