local lockfile_path = vim.fn.stdpath("config") .. "/.lazy-locks"
local lazy_config = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "nightfox" },
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = false, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},
	{ lockfile = lockfile_path .. "/lazy-base-lock.json" },
	spec = {
		{ import = "commons" },
		{ import = "commons/lsp" },
		{ import = "commons/ui" },
	},
}

require("core.keymaps").set_mapleader()
local M = {}
M.current_profile = require("core.profile").get_current_profile()

M.profile = {}

if M.current_profile then
	local ok, profile = pcall(require, "profiles." .. M.current_profile .. ".init")
	local ok, global_profile = pcall(require, "profiles." .. "global" .. ".init")
	M.profile = profile
	M.global_profile = global_profile
	if ok then
		lazy_config.lockfile = lockfile_path .. M.current_profile .. "/lazy-lock.json"
		lazy_config.reset = true

		lazy_config.spec = {
			{ import = "commons" },
			{ import = "commons/lsp" },
			{ import = "commons/ui" },
			{ import = "profiles/" .. "global" .. "/plugins" },
			{ import = "profiles/" .. M.current_profile .. "/plugins" },
		}
		require("lazy").setup(lazy_config)

		-- for index, value in pairs(M.profile.mason) do
		-- 	vim.lsp.enable(value)
		-- end

		if not (M.profile.name == M.global_profile.name) then
			for index, value in pairs(M.global_profile.lsp) do
				vim.lsp.enable(value)
			end
		end

		for index, value in pairs(M.profile.lsp) do
			vim.lsp.enable(value)
		end
	else
		-- Fallback if profile is invalid
		require("lazy").setup(lazy_config)
	end
else
	-- Fallback minimal config with profile selector
	require("lazy").setup(lazy_config)
end

-- -- Remap space as leadder key
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
-- Keymap to switch profiles
vim.keymap.set("n", "<leader>sp", function()
	require("core.profile").profile_picker()
end)

vim.api.nvim_create_user_command("MasonInstallGlobal", function()
	local packages = table.concat(M.global_profile.mason, " ")
	vim.cmd("MasonInstall " .. packages)
end, {})

vim.api.nvim_create_user_command("MasonInstallFromProfile", function()
	local packages = table.concat(M.profile.mason, " ")
	vim.cmd("MasonInstall " .. packages)
end, {})

return M
