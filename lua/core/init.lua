require("core.options")
require("core.lazy")
require("core.keymaps")


-- replace these with a function that can change the color scheme.
local colorscheme = "darkplus"
local status_ok, _ = pcall (vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local current_theme_status_ok, lspconfig = pcall(require, "current-theme")
if not current_theme_status_ok then
	return
end

