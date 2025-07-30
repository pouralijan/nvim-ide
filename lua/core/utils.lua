local M = {}
M.tableHasKey = function(table, key)
    return table[key] ~= nil
end

function M:SaveColorScheme()
    local colorscheme = vim.g.colors_name or "default"
    local file = io.open(vim.fn.stdpath("config") .. ".colorscheme", "w")
    if file then
        file:write(colorscheme)
        file:close()
    end
end

function M:LoadColorScheme()
    local file = io.open(vim.fn.stdpath("config") .. ".colorscheme", "r")
    if file then
        local colorscheme = file:read("*l")
        file:close()
        if colorscheme then
            vim.cmd("colorscheme " .. colorscheme)
        end
    end
end

function M:ChangeColorScheme(scheme)
    vim.cmd("colorscheme " .. scheme)
    M:SaveColorScheme()
end

return M
