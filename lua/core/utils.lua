local M = {}
M.tableHasKey = function(table, key)
    return table[key] ~= nil
end

function M:SaveColorScheme(colorscheme)
    colorscheme = colorscheme or vim.g.colors_name or "default"
    local file_path = vim.fn.stdpath("config") .. "/.colorscheme"
    local file = io.open(file_path, "w")
    if file then
        file:write(colorscheme)
        file:close()
    end
    vim.notify("Save " .. colorscheme .. " inot " .. file_path)
end

function M:LoadColorScheme()
    local file = io.open(".nvim/colorscheme", "r")
    -- local file = io.open(vim.fn.stdpath("config") .. "/.colorscheme", "r")
    if not file then
        file = io.open(vim.fn.stdpath("config") .. "/.colorscheme", "r")
    end

    if file then
        local colorscheme = file:read("*l")
        file:close()
        if colorscheme then
            vim.cmd("colorscheme " .. colorscheme)
        end
    end
end

function M:ChangeColorScheme(selected, opts)
    -- if #selected == 0 then return end
    -- local dbkey, idx = selected[1]:match("^(.-):(%d+):")
    -- if dbkey then
    --     opts._apply_awesome_theme(dbkey, idx, opts)
    -- else
    --     local colorscheme = selected[1]:match("^[^:]+")
    --     pcall(function() vim.cmd("colorscheme " .. colorscheme) end)
    --     M:SaveColorScheme(colorscheme)
    -- end

    -- vim.notify("Change colorscheme")
    -- local file_path = vim.fn.stdpath("config") .. "/.colorschemelll"
    -- local file = io.open(file_path, "w")
    -- if file then
    --     for index, value in ipairs(selected) do
    --         file:write(value)
    --     end
    --     file:close()
    -- end
    -- -- vim.notify(selected)
    -- -- M:SaveColorScheme(selected)
end

return M
