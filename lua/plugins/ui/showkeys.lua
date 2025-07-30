require("plugins"):add("nvzone/showkeys")
local options = {
    timeout = 1,
    maxkeys = 5,
    excluded_modes = {"i"},
    show_count= true,
  }

require("showkeys").setup(options)
