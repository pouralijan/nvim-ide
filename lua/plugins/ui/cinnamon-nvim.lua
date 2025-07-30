require("plugins"):add("declancm/cinnamon.nvim", {
    "folke/flash.nvim",
})

local cinnamon = require("cinnamon")

cinnamon.setup({
    optoin = {
        delay = 1,
        mode = "window",
    },
})

-- Centered scrolling:
vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)

-- LSP:
vim.keymap.set("n", "gd", function() cinnamon.scroll(vim.lsp.buf.definition) end)
vim.keymap.set("n", "gD", function() cinnamon.scroll(vim.lsp.buf.declaration) end)

-- Flash.nvim integration:
local flash = require("flash")
local jump = require("flash.jump")

flash.setup({
    action = function(match, state)
        cinnamon.scroll(function()
            jump.jump(match, state)
            jump.on_jump(state)
        end)
    end,
})
