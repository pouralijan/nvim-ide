require("core.options")
require("core.keymaps")
require("core.lazy")


-- replace these with a function that can change the color scheme.
local colorscheme = "darkplus"
local status_ok, _ = pcall (vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
