local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local M = {}

-- Remap space as leadder key
keymap.set("", "<Space>", "Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal_mode = "n"
--    insert_mode = "i"
--    visual_mode = "v"
--    visual_block_mode = "x"
--    term_mode = "t"
--    command_mode = "c"

-- General
-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right
-- Pane Resize
keymap.set("n", "<leader>rh", ":vertical resize +2<CR>", opts) -- Resize Left
keymap.set("n", "<leader>rj", ":resize -2<CR>", opts) -- Resize Down
keymap.set("n", "<leader>rk", ":resize +2<CR>", opts) -- Resize Up
keymap.set("n", "<leader>rl", ":vertical resize -2<CR>", opts) -- Resize Right

keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts) -- Resize Left
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts) -- Resize Down
keymap.set("n", "<C-UP>", ":resize +2<CR>", opts) -- Resize Up
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts) -- Resize Right

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Window Management
-- keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Maximize ???

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-1<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)


-- Plugins
-- Directory Navigation
-- nvim-tree
keymap.set("n", "<C-n>", ":NvimTreeToggle <CR>", opts) --, "Toggle nvimtree")
keymap.set("n", "<leader>e", ":NvimTreeFocus <CR>", opts) --, "Focus nvimtree")
keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>", opts)

-- whichkey
--"Which-key all keymaps",
keymap.set("n", "<leader> ", function() vim.cmd "WhichKey" end, opts)
-- "Which-key query lookup",
keymap.set("n", "<leader>wk",
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
    opts
)

-- Telescope
-- local telescope_builtin = require('telescope.builtin')
keymap.set("n", "<leader>fa", ":Telescope")
-- keymap.set("n", "<leader>fk", telescope_builtin.keymaps, opts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
-- Telescope
-- find
keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", opts) -- "Find files" },
keymap.set("n", "<leader>fs", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", opts) -- "Find all" },
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", opts) -- "Live grep" },
keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", opts) -- "Find buffers" },
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", opts) -- "Help page" },
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", opts) -- "Find oldfiles" },
keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", opts) -- "Find in current buffer" },

-- Telescope
-- git
keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", opts) -- "Git commits" },
keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", opts) -- "Git status" },

-- Telescope
-- pick a hidden term
keymap.set("n", "<leader>pt", "<cmd> Telescope terms <CR>", opts) -- "Pick hidden term" },

-- Telescope
-- theme switcher
keymap.set("n", "<leader>th", "<cmd> Telescope themes <CR>", opts) -- "Nvchad themes" },

keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>", opts) -- "telescope bookmarks" },

local actions = require "telescope.actions"

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
return M
