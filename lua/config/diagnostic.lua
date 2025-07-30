local M = {}
M.virtual_text = {
    prefix = function(diagnostic, i, total)
        local text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
        }

        return text[diagnostic.severity] .. diagnostic.source .. "(" .. i .. "/" .. total .. ")"
    end,
    spacing=2,
    format = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
            return string.format('[%s]: %s %s',diagnostic.source, code, diagnostic.message )
        else
            return ""
        end
    end,
}

M.virtual_lines = {
    format = function(diagnostic)
        local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
        return string.format('%s %s', code, diagnostic.message)
    end,
}

vim.keymap.set('n', 'gK', function()
    local v_text = vim.diagnostic.config().virtual_text
    local v_lines = vim.diagnostic.config().virtual_lines

    if not v_text then
        v_text = M.virtual_text
    else
        v_text = false
    end

    if not v_lines then
        v_lines = M.virtual_lines
    else
        v_lines = false
    end

    vim.diagnostic.config({
        virtual_lines = v_lines,
        -- virtual_text = v_text -- comment this if use tiny-inline-diagnostic plugin
    })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Appearance of diagnostics
vim.diagnostic.config {
    virtual_text = M.virtual_text,
    underline = true,
    update_in_insert = true,
    -- float = {
    --     source = "if_many"
    -- },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
        },
    },
    -- Make diagnostic background transparent
    on_ready = function()
        vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
    end,
}
