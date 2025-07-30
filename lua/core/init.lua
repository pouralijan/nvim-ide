require("core.options")
require("core.keymaps")

--require("core.lazyp")
--require("core.pp")
--local current_profile = require("core.profile").get_current_profile()
-- require("core.mason")
--require("core.profile")
require("core.autocmds")
require("config")

require("plugins"):loads()

-- local configs = {
--     "configs.autosave",
--     "configs.cmp",
--     "configs.formatter",
--     "configs.icons_fonts",
--     "configs.mason",
--     "configs.telescope",
--     "configs.ui.nocie",
--     "configs.ui.nvim-lualine",
-- }
-- for _, config in pairs(configs) do
--     print("config" .. config)
-- 	server = vim.split(config, "@")[1]
-- 	require(config)
-- end

require("core.utils"):LoadColorScheme()
--require("config.lsp.lsp")
-- local current_theme_status_ok, _ = pcall(require, "current-theme")
-- if not current_theme_status_ok then
-- 	return
-- end
--
--vim.filetype.add({
--	extension = {
--		jinja = "jinja",
--		jinja2 = "jinja",
--		j2 = "jinja",
--	},
--})
