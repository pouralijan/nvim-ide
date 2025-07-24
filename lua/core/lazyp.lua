-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable", -- latest stable release
-- 		lazypath,
-- 	})
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- local opts = {
-- 	defaults = {
-- 		lazy = true,
-- 	},
-- 	install = {
-- 		colorscheme = { "nightfox" },
-- 	},
-- 	rtp = {
-- 		disabled_plugins = {
-- 			"gzip",
-- 			"matchit",
-- 			"matchparen",
-- 			"netrwPlugin",
-- 			"tarPlugin",
-- 			"tohtml",
-- 			"tutor",
-- 			"zipPlugin",
-- 		},
-- 	},
-- 	change_detection = {
-- 		enabled = true,
-- 		notify = false,
-- 	},
-- 	checker = {
-- 		-- automatically check for plugin updates
-- 		enabled = true,
-- 		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
-- 		notify = false, -- get a notification when new updates are found
-- 		frequency = 3600, -- check for updates every hour
-- 		check_pinned = false, -- check for pinned packages that can't be updated
-- 	},
-- 	{ lockfile = vim.fn.stdpath("config") .. "/lazy-base-lock.json" },
-- }
-- require("lazy").setup("plugins", opts)
-- -- require("lazy").setup({ {import = 'plugins'}, { import = "plugins.config.lsp"}, opts)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("core.keymaps").set_mapleader()

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
