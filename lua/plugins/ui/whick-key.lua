require("plugins"):add("folke/which-key.nvim")
--require("core.keymaps").set_mapleader()

-- local wk = require("which-key")
-- wk.add({
--     { "<leader>a",  group = "automate" }, -- group
--     { "<leader>af", vim.lsb.buf.format, desc = "autoformat", mode = "n" },
-- })

require("which-key").setup({
    --    spec = {
    --        { "<leader>a",  group = "automate" }, -- group
    --        { "<leader>af", vim.lsb.buf.format, desc = "autoformat", mode = "n" },
    --    },
    triggers = {
        { "<auto>", mode = "nxso" },
    },
})


-- require("which-key").show({
--   keys = "<c-w>",
--   loop = true, -- this will keep the popup open until you hit <esc>
-- })
