require("core.options")
require("core.lazy")
require("core.keymaps")
require("core.autocmds")

local current_theme_status_ok, _ = pcall(require, "current-theme")
if not current_theme_status_ok then
	return
end
