require("plugins"):add({
    'nvim-flutter/flutter-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
})


require("flutter-tools").setup {}
