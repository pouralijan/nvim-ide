require("plugins"):add({
    "code-biscuits/nvim-biscuits",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}
)

require('nvim-treesitter').setup()

vim.cmd([[highlight BiscuitColor ctermfg=red]])
vim.cmd([[highlight BiscuitColorPython ctermfg=red]])
-- vim.cmd([[highlight BiscuitColorRust ctermfg=red]])
require('nvim-biscuits').setup({
    default_config = {
        max_length = 12,
        min_distance = 5,
        -- prefix_string = " 📎 "
        prefix_string = " 📎 "
    },
    toggle_keybind = "<leader>cb",
    -- cursor_line_only = true
})

