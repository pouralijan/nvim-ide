local M = {}

function M:add(plugin, dependencies)
    local github = "https://github.com/"
    dependencies = dependencies or {}
    local packages = {}
    table.insert(packages, {src= github .. plugin})
    for _, dep in ipairs(dependencies) do
        table.insert(packages, {src= github .. dep})
    end
    vim.pack.add(packages)
end

local plugins_config = {
    plugins_dir = nil,
    lua_subpath = "plugins",
}
function M:loads(plugins_dir)
    plugins_dir = plugins_dir or plugins_config.plugins_dir or
    vim.fn.stdpath("config") .. "/lua/" .. plugins_config.lua_subpath
    local files = vim.fn.readdir(plugins_dir)
    for _, file in ipairs(files) do
        local full_path = plugins_dir .. '/' .. file
        if vim.fn.isdirectory(full_path) == 1 then
            M:loads(full_path)
        elseif file:match('%.lua$') then
            local plugin_name = file:sub(1, -5) -- Remove the .lua extension
            if plugin_name == "init" then
                goto continue
            end
            require(full_path:gsub('/lua/', ''):sub(#vim.fn.stdpath('config') + 1, -5)) -- Load the plugin
            ::continue::
        end
    end
end

return M
