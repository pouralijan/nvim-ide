require("plugins"):add("ibhagwan/fzf-lua",
    { "nvim-tree/nvim-web-devicons" })
-- optional for icon support
-- dependencies = { "nvim-tree/nvim-web-devicons" },
-- or if using mini.icons/mini.nvim
-- dependencies = { "echasnovski/mini.icons" },
--
require("fzf-lua").setup({
    fzf_colors = true,
    colorschemes = {
        preview = true, -- enable preview
        ignore_patterns = {
            "^blue$",
            "^darkblue$",
            "^default$",
            "^delek$",
            "^desert$",
            "^elflord$",
            "^evening$",
            "^habamax$",
            "^industry$",
            "^koehler$",
            "^lunaperche$",
            "^morning$",
            "^murphy$",
            "^pablo$",
            "^peachpuff$",
            "^quiet$",
            "^ron$",
            "^shine$",
            "^slate$",
            "^torte$",
            "^zellner$",
        }
    }
})

local MyMap = require("core.keymaps").MyMap


MyMap("n",
    "<leader>ff",
    function()
        require("fzf-lua").files()
    end,
    "Find files in project directory")
MyMap("n",
    "<leader>fg",
    function()
        require("fzf-lua").live_grep({ resume = true })
    end,
    "Find by greping in project directory")
MyMap("n",
    "<leader>fr",
    function()
        require("fzf-lua").resume()
    end,
    "Resume last FzfLua")
MyMap("n",
    "<leader>fc",
    function()
        require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
    end,
    "Find nvim config file.")
MyMap("n",
    "<leader>fh",
    function()
        require("fzf-lua").helptags()
    end,
    "Find nvim config file.")
MyMap("n",
    "<leader>fk",
    function()
        require("fzf-lua").keymaps()
    end,
    "[f][k]eymaps.")
MyMap("n",
    "<leader>fw",
    function()
        require("fzf-lua").grep_cword()
    end,
    "[f]ind current [w]ord.")
MyMap("n",
    "<leader>fW",
    function()
        require("fzf-lua").grep_cWORD()
    end,
    "[f]ind current [W]ord.")
MyMap("n",
    "<leader>fd",
    function()
        require("fzf-lua").diagnostics_document()
    end,
    "[f]ind [d]iagnostics.")
MyMap("n",
    "<leader>fo",
    function()
        require("fzf-lua").oldfiles()
    end,
    "[f]ind [o]ld files.")
MyMap("n",
    "<leader>fb",
    function()
        require("fzf-lua").buffers()
    end,
    "[f]ind [b]uffers.")
MyMap("n",
    "<leader>f/",
    function()
        require("fzf-lua").lgrep_curbus()
    end,
    "[f][/] Live grep the current buffer.")
-- =============== UI
MyMap("n",
    "<leader>cd",
    function()
        local fzf = require("fzf-lua")
        local a = fzf.awesome_colorschemes({
            async = true,
            fzf_opts = {
                ["--bind"] = "enter:execute(ChangeColorScheme)"
            }
        })
        print(a)
    end,
    "[f][/] Live grep the current buffer.", { noremap = true, silent = true })

MyMap("n",
    "<leader>cc",
    function()
        local fzf = require("fzf-lua")
        local a = fzf.colorschemes({
            fzf_opts = {
                ["--bind"] = "enter:execute(ChangeColorScheme)"
            }
        })
        print(a)
    end,
    "[f][/] Live grep the current buffer.", { noremap = true, silent = true })
-- =============== LSP
MyMap("n",
    "<leader>lr",
    function()
        require("fzf-lua").lsp_references()
    end,
    "[l]sp [r]eferences.")
MyMap("n",
    "<leader>ld",
    function()
        require("fzf-lua").lsp_definitions()
    end,
    "[l]sp [d]efinitionsl.")
MyMap("n",
    "<leader>lD",
    function()
        require("fzf-lua").lsp_declarations()
    end,
    "[l]sp [D]eclarations.")
MyMap("n",
    "<leader>lt",
    function()
        require("fzf-lua").lsp_typedefs()
    end,
    "[l]sp [t]ypedefs.")
MyMap("n",
    "<leader>li",
    function()
        require("fzf-lua").lsp_implementations()
    end,
    "[l]sp [i]mplementations.")
MyMap("n",
    "<leader>ls",
    function()
        require("fzf-lua").lsp_document_symbols()
    end,
    "[l]sp document [s]ymbols.")
MyMap("n",
    "<leader>lsw",
    function()
        require("fzf-lua").lsp_workspace_symbols()
    end,
    "[l]sp [s]ymbols of [w]orkspace .")
MyMap("n",
    "<leader>lsl",
    function()
        require("fzf-lua").lsp_live_workspace_symbols()
    end,
    "[l]sp [s]ymbols of [l]ive workspace .")
MyMap("n",
    "<leader>lci",
    function()
        require("fzf-lua").lsp_incoming_calls()
    end,
    "[l]sp [c]alls [i]ncoming.")
MyMap("n",
    "<leader>lco",
    function()
        require("fzf-lua").lsp_outgoing_calls()
    end,
    "[l]sp [c]alls [o]utgoing.")
MyMap("n",
    "<leader>lca",
    function()
        require("fzf-lua").lsp_code_actions()
    end,
    "[l]sp [c]ode [a]ctions.")
MyMap("n",
    "<leader>lf",
    function()
        require("fzf-lua").lsp_finder()
    end,
    "[l]sp [f]ind. All LSP locations, combined view.")
MyMap("n",
    "<leader>ldd",
    function()
        require("fzf-lua").diagnostics_document()
    end,
    "[l]sp [d]iagnostics document.")
MyMap("n",
    "<leader>ldw",
    function()
        require("fzf-lua").diagnostics_workspace()
    end,
    "[l]sp [d]iagnostics workspace.")
