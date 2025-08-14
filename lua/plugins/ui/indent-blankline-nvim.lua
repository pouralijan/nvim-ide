require("plugins"):add("lukas-reineke/indent-blankline.nvim")
-- local highlight = {
--     "CursorColumn",
--     "Whitespace",
-- }
require("ibl").setup({
    indent = { char = "▏" }, -- ┆│⦙
    -- whitespace = {
    --     highlight = highlight,
    --     remove_blankline_trail = false,
    -- },
    -- scope = {
    --     enabled = true,
    --     show_start = true,
    --     show_end = true,
    --     injected_languages = false,
    --     highlight = { "Function", "Label", "Conditional", "Repeat" },
    --     -- priority = 500,
    -- }
    scope = { enabled = true }, -- Disable context highlighting
})
