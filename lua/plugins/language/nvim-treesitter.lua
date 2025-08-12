local options = {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "fish",
        "gitignore",
        "graphql",
        "html",
        "http",
        "javascript",
        "json",
        "just",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    },

    sync_install = false,
    additional_vim_regex_highlighting = true,
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlight = false,
    },

    indent = { enable = true },

    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    autopairs = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            scop_incremental = false,
            node_decremental = "<Backspace>",
        },
    },
}

require("plugins"):add("nvim-treesitter/nvim-treesitter", { "windwp/nvim-ts-autotag" })
require("nvim-treesitter.configs").setup(options)
