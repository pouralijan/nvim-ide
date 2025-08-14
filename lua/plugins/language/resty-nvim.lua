require("plugins"):add(
    {
        "lima1909/resty.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }
)

-- :Resty run 	run request under the cursor OR in visual mode run the marked request rows
-- :Resty run [request definition] 	run request which is given by input, rows are seperated by \n (you can simulate \n with <C-v><CR> in command mode)
-- :Resty last 	run last successfully executed request
-- :Resty favorite 	show a telescope view with all as favorite marked requests
-- :Resty favorite [my favorite] 	run marked request my favorite, independend, where the cursor is or in which buffer


local MyMap = require("core.keymaps").MyMap

MyMap({ "n", "v" },
    "<leader>rr",
    ":Resty run<CR>",
    "[R]esty [R]un request under the cursor")

MyMap({ "n", "v" },
    "<leader>rv",
    ":Resty favorite<CR>",
    "[R]esty [V]iew favorites")
