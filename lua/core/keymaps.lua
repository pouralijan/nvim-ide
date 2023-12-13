local keymap = vim.keymap
local nvim_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local M = {}

function MyMap(mode, lhs, rhs, opts)
  -- Modes
  --    normal_mode = "n"
  --    insert_mode = "i"
  --    visual_mode = "v"
  --    visual_block_mode = "x"
  --    term_mode = "t"
  --    command_mode = "c"
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Remap space as leadder key
MyMap("", "<Space>", "Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
-- Pane Navigation
MyMap("n", "<C-h>", "<C-w>h", {desc = "Navigate Left Pane"})
MyMap("n", "<C-j>", "<C-w>j", {desc = "Navigate Down Pane"})
MyMap("n", "<C-k>", "<C-w>k", {desc = "Navigate Up Pane"})
MyMap("n", "<C-l>", "<C-w>l", {desc = "Navigate Right Pane"})
-- Pane Resize
MyMap("n", "<leader>rh", ":vertical resize +2<CR>", {desc = "Resize Left"})
MyMap("n", "<leader>rj", ":resize -2<CR>", {desc = "Resize Down"})
MyMap("n", "<leader>rk", ":resize +2<CR>", {desc = "Resize Up"})
MyMap("n", "<leader>rl", ":vertical resize -2<CR>", {desc = "Resize Right"})

MyMap("n", "<C-Left>", ":vertical resize +2<CR>", {desc = "Resize Left"})
MyMap("n", "<C-Down>", ":resize -2<CR>", {desc = "Resize Down"})
MyMap("n", "<C-UP>", ":resize +2<CR>", {desc = "Resize Up"})
MyMap("n", "<C-Right>", ":vertical resize -2<CR>", {desc = "Resize Right"})

-- Indenting
MyMap("v", "<", "<gv")
MyMap("v", ">", ">gv")

-- Window Management
MyMap("n", "<leader>sv", ":vsplit<CR>",          {desc = "Split Vertically"})
MyMap("n", "<leader>sh", ":split<CR>",           {desc = "Split Horizontally"})
MyMap("n", "<leader>sm", ":MaximizerToggle<CR>", {desc = "Toggle Maximize ???"})

-- Move text up and down
MyMap("v", "<A-j>", ":m .+1<CR>==")
MyMap("v", "<A-k>", ":m .-1<CR>==")
MyMap("v", "p", '"_dP')

-- Buffer
MyMap("n", "<M-h>", ":bprev <CR>", {desc = "Navigate Prev Buffer"})
MyMap("n", "<M-j>", ":bfirst <CR>", {desc = "Navigate Firest Buffer"})
MyMap("n", "<M-k>", ":blast <CR>", {desc = "Navigate Last Buffer"})
MyMap("n", "<M-l>", ":bnext <CR>", {desc = "Navigate Next Buffer"})
MyMap("n", "<M-x>",function()
    require("plugins.configs.bufferline").buf_kill("bd",nil, false)
  end,
  {desc = "Navigate Next Buffer"}
)

-- Plugins
-- Directory Navigation
-- nvim-tree
MyMap("n", "<C-n>", ":NvimTreeToggle <CR>") --, "Toggle nvimtree")
MyMap("n", "<leader>e", ":NvimTreeFocus <CR>") --, "Focus nvimtree")
MyMap("n", "<leader>et", ":NvimTreeToggle<CR>")

-- whichkey
--"Which-key all keymaps",
MyMap("n", "<leader>", function() vim.cmd "WhichKey" end)
MyMap("n", "<leader> ", function() vim.cmd "WhichKey" end)
-- "Which-key query lookup",
MyMap("n", "<leader>wk",
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      {desc= "WhichKey input"}
)

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
MyMap("n", "<leader>fa", ":Telescope")
-- MyMap("n", "<leader>fk", telescope_builtin.keymaps)
MyMap("n", "<leader>fh", ":Telescope help_tags<CR>")
-- Telescope
-- find
MyMap("n", "<leader>ff", "<cmd> Telescope find_files <CR>", {desc = "Find files" })
MyMap("n", "<leader>fs", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", {desc = "Find all" })
MyMap("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", {desc = "Live grep" })
MyMap("n", "<leader>lg", ":Telescope live_grep<CR>")
MyMap("n", "<leader>fb", "<cmd> Telescope buffers <CR>", {desc = "Find buffers" })
MyMap("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", {desc = "Help page" })
MyMap("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", {desc = "Find oldfiles" })
MyMap("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", {desc = "Find in current buffer" })

-- Telescope
-- git
MyMap("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", {desc = "Git commits" })
MyMap("n", "<leader>gt", "<cmd> Telescope git_status <CR>", {desc = "Git status" })

-- Telescope
-- pick a hidden term
MyMap("n", "<leader>pt", "<cmd> Telescope terms <CR>", {desc = "Pick hidden term" })

-- Telescope
-- theme switcher
MyMap("n", "<leader>th", "<cmd> Telescope themes <CR>", {desc = "Nvchad themes" })

MyMap("n", "<leader>ma", "<cmd> Telescope marks <CR>", {desc = "telescope bookmarks" })

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
