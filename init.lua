vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },

    --{src="https://github.com/nvim-tree/nvim-web-devicons"}, -- not strictly required, but recommended
    --{src="https://github.com/3rd/image.nvim"}, -- Optional image support in preview window: See `# Preview Mode` for more information
    --{src="https://github.com/s1n7ax/nvim-window-picker"},
}
)
require("core")


-- local lsp_attch_callback = function(event)
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--     if client:supports_method("textDocument/completion") then
--         vim.lsp.completion.enable(true, client.id, event.buf, {autotrigger = true})
--     end
-- end
-- -- autocmd("LspAttach", { group = lsp, callback = lsp_attch_callback })
-- autocmd("LspAttach", { callback = lsp_attch_callback })
--
-- vim.cmd("set completeopt+=noselect")
