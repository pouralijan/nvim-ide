local keymap = vim.keymap
local opts = { noremap = true, silent = true }

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
keymap.set("n", "<leader>ef", ":NvimTreeFocus <CR>", opts) --, "Focus nvimtree")
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
