require("plugins"):add('akinsho/toggleterm.nvim')

require("plugins"):add({
    "jim-at-jibba/micropython.nvim",
    dependencies = {
        "akinsho/toggleterm.nvim",
        "stevearc/dressing.nvim",
    },
})

