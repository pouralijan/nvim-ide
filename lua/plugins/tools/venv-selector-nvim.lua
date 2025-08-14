require("plugins"):add(
    {
        "linux-cultist/venv-selector.nvim",
        version = "regexp",

        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
            -- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        }
    }
)

require("venv-selector").setup({
    keys = {
        { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
})
