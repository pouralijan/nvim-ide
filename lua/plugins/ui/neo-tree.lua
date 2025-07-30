require("plugins"):add("nvim-neo-tree/neo-tree.nvim")

local MyMap = require("core.keymaps").MyMap
-- neo-tree
MyMap("n", "<C-e>", ":Neotree toggle<CR>", "Toggle nvimtree")
MyMap("n", "<leader>e", ":Neotree filesystem reveal left<CR>", "Focus nvimtree")
MyMap("n", "<leader>et", ":Neotree toggle<CR>")
MyMap("n", "<leader>ef", ":Neotree filesystem reveal float<CR>")

require("neo-tree").setup({
    auto_expand_width = false,
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    statusline = false,
    source_selector = {
        winbar = true,
        statusline = false,
    },
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                --".DS_Store",
                --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
            },
        },
        follow_current_file = {
            enabled = true,                     -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = true,             -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true,                -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
    },
    window = {
        mappings = {
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
    },
})
