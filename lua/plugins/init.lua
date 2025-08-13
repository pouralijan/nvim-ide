local M = {}

function M:add(plugin)
    local github = "https://github.com/"
    local dependencies = {}
    local plugin_name = plugin
    local version = nil

    if type(plugin) == "table" then
        dependencies = plugin.dependencies or {}
        version = plugin.version
        plugin_name = plugin[1]
        -- print(plugin_name)
    end
    -- for i, dep in ipairs(dependencies) do
    --     print("dep: " .. i .. dep)
    -- end


    local packages = {}
    table.insert(packages, { src = github .. plugin_name })
    if version == nil then
        table.insert(packages, { src = github .. plugin_name })
    else
        table.insert(packages, { src = github .. plugin_name, version = version })
    end
    for _, dep in ipairs(dependencies) do
        -- print("dep: " .. dep)
        if type(dep) == "table" then
            M:add(dep)
        else
            table.insert(packages, { src = github .. dep })
        end
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
