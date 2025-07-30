require("plugins"):add("folke/flash.nvim")
require("flash").setup({})

local MyMap = require("core.keymaps").MyMap
-- keys = {
--     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
--     { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
--     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
--   },
-- neo-tree
MyMap({ "n", "x", "o" }, "<leader>s", function() require("flash").jump() end, "Flash Jamp")
MyMap({ "c" }, "<c-s>", function() require("flash").toggle() end, "Flash Jamp")

