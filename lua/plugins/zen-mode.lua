require("plugins"):add("folke/zen-mode.nvim")

require("zen-mode").setup({
    window = {
        backdrop = .1,
        width = 1,
        height = 1,
    }
})

local MyMap = require("core.keymaps").MyMap


MyMap("n",
    "<leader>zf",
    function()
        require("zen-mode").toggle()
    end,
    "ZenMode full screen toggle")
