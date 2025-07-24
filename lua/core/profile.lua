local M = {}
M.profiles = nil

M.profiles_dir = vim.fn.stdpath("config") .. "/lua/profiles/"

-- M.get_profiles = function()
-- 	local profiles = {}
-- 	local dirs = vim.fn.glob(M.profiles_dir .. "*", true, true)
--
-- 	print("-------")
-- 	table.insert(profiles, {
-- 		name = "p1",
-- 		display = "P1",
-- 	})
-- 	table.insert(profiles, {
-- 		name = "p2",
-- 		display = "P2",
-- 	})
-- 	for _, dir in ipairs(dirs) do
-- 		print("-------")
-- 		local profile_name = dir:match("([^/]+)$")
-- 		print(profile_name)
-- 		-- local res, config = require("profiles." .. profile_name .. ".init")
-- 		-- local ok, config = pcall(require, "profiles." .. profile_name .. ".init")
-- 		-- print(config)
-- 		table.insert(profiles, {
-- 			name = profile_name,
-- 			display = dir,
-- 			-- display = config.name or profile_name,
-- 			-- plugins = config.plugins or {},
-- 			-- config = config.config,
-- 			config = {},
-- 		})
-- 	end
--
-- 	return profiles
-- end
--
local config = {
	profiles_dir = nil,
	lua_subpath = "profiles",
	use_telescope = true,
}

function M.setup(user_opts)
	config = vim.tbl_deep_extend("force", config, user_opts or {})
	vim.validate({
		use_telescope = { config.use_telescope, "boolean" },
		profiles_dir = { config.profiles_dir, "string", true },
	})
end

M.load_profiles = function()
	if M.profiles then
		return M.profiles
	end
	local profile_dir = config.profiles_dir or vim.fn.stdpath("config") .. "/lua/" .. config.lua_subpath
	local dirs = vim.fn.glob(profile_dir .. "/*", true, true)
	local profiles = {}

	-- vim.notify("Loading profiles from: " .. profile_dir, vim.log.levels.DEBUG)

	for _, dir in ipairs(dirs) do
		if vim.fn.isdirectory(dir) == 1 then
			local name = vim.fn.fnamemodify(dir, ":t")
			local init_file = dir .. "/init.lua"

			if vim.fn.filereadable(init_file) == 1 then
				local chunk, err = loadfile(init_file)
				if not chunk then
					vim.notify("Failed to load " .. init_file .. ": " .. err, vim.log.levels.ERROR)
					goto continue
				end

				local ok, module = pcall(chunk)
				if ok and module and module.name then
					module.dir = dir
					table.insert(profiles, {
						name = name,
						module = module,
					})
					vim.notify("Loaded profile: " .. module.name, vim.log.levels.DEBUG)
				else
					vim.notify("Invalid profile in " .. dir, vim.log.levels.WARN)
				end
				module = nil
			end
		end
		::continue::
	end

	M.profiles = profiles
	return profiles
end
M.load_profile = function()
	local profiles = M.load_profiles()
	local cp = M.get_current_profile()
	for i, line in ipairs(profiles) do
		if line.name == cp then
			local profile = line.module
			return profile
		end
	end
end

M.set_profile = function(profile_name)
	-- vim.fn.setenv("NVIM_PROFILE", profile_name)
	if profile_name == nil then
		profile_name = "python"
	end

	local file = io.open(vim.fn.stdpath("config") .. "/current_profile", "w")
	file:write(profile_name)
	file:close()
end

M.get_current_profile = function()
	local profile = nil
	profile = os.getenv("NVIM_PROFILE")
	if profile then
		return profile
	end
	local file = io.open(".nvim/current_profile", "r")
	if file then
		profile = file:read()
		file:close()
		return profile
	end
	profile = vim.fn.input("Enter profile name: ")
	if profile then
		vim.fn.setenv("NVIM_PROFILE", profile)
		save = vim.fn.input("Do you want to save profile in workspace [y/N]? ")
		if save == "y" then
			vim.fn.mkdir(".nvim", "p")
			local file_path = ".nvim/current_profile"
			local file = io.open(file_path, "w")
			if file then
				file:write(profile)
				file:close()
				vim.notify("Profile (" .. profile .. ") saved for this workspace", vim.log.levels.INFO)
			else
				vim.notify("Error: Could not open file for writing.", vim.log.levels.INFO)
			end
		end
	else
		profile = "global"
	end
	return profile
end

-- M.profile_picker = function(opts)
-- 	local pickers = require("telescope.pickers")
-- 	local finders = require("telescope.finders")
-- 	local conf = require("telescope.config").values
-- 	local actions = require("telescope.actions")
-- 	local action_state = require("telescope.actions.state")
-- 	opts = opts or {}
--
-- 	local res = vim.tbl_map(function(p)
-- 		print("--->")
-- 		print(p.display)
-- 		return { p.display, p.name }
-- 		-- end, require("core.profile").get_profiles()),
-- 	end, M.get_profiles())
--
-- 	pickers
-- 		.new(opts, {
-- 			prompt_title = "Select Profile",
-- 			finder = finders.new_table({
-- 				results = { "p1", "p2" },
-- 			}),
-- 			sorter = conf.generic_sorter(opts),
-- 			attach_mappings = function(prompt_bufnr, map)
-- 				actions.select_default:replace(function()
-- 					local selection = action_state.get_selected_entry()
-- 					actions.close(prompt_bufnr)
-- 					require("core.profile").set_profile(selection[2])
-- 					print("Selected profile: " .. selection[2])
-- 					vim.cmd("qa!") -- Restart Neovim
-- 				end)
-- 				return true
-- 			end,
-- 		})
-- 		:find()
-- end

-- function M.select_profile()
function M.profile_picker()
	-- if package.loaded["lazy"] then
	-- 	vim.notify("Profile selection unavailable after initial load", vim.log.levels.WARN)
	-- 	return nil
	-- end

	-- local profiles = M.get_profiles()
	local profiles = load_profiles()
	if #profiles == 0 then
		vim.notify("No profiles found", vim.log.levels.ERROR)
		return nil
	end

	local ok, err = pcall(require, "telescope")
	if not ok then
		vim.notify("Telescope not available: " .. err, vim.log.levels.ERROR)
		return M.cli_selector(profiles)
	end
	return M.selector(profiles, M)
	-- if config.use_telescope then
	-- 	local ok, err = pcall(require, "telescope")
	-- 	if not ok then
	-- 		vim.notify("Telescope not available: " .. err, vim.log.levels.ERROR)
	-- 		return M.cli_selector(profiles)
	-- 	end
	-- 	return require("profile-manager.telescope").selector(profiles, M)
	-- else
	-- 	return M.cli_selector(profiles)
	-- end
end

M.selector = function(profiles, manager)
	local has_telescope, telescope = pcall(require, "telescope")
	if not has_telescope then
		return
	end

	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	local make_entry = function(entry)
		return {
			value = entry,
			display = entry.module.name,
			ordinal = entry.module.name,
			path = entry.module.dir,
			preview_command = function(entry)
				return { "bat", "--style=header,grid", entry.path .. "/init.lua" }
			end,
		}
	end

	pickers
		.new({}, {
			prompt_title = "NVIM Profiles",
			finder = finders.new_table({
				results = profiles,
				entry_maker = make_entry,
			}),
			sorter = conf.generic_sorter({}),
			previewer = conf.grep_previewer({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if not selection then
						return
					end

					M.set_profile(selection.value.name)
					vim.notify("profile change to " .. selection.value.name)
					vim.schedule(function()

						-- Clear existing plugins
						-- package.loaded["lazy"] = nil
						--
						-- -- Set up new plugin manager instance
						-- local lazy = require("lazy")
						-- lazy.setup(manager.current_profile.plugins, {
						-- 	lockfile = manager.current_profile.dir .. "/lazy-lock.json",
						-- 	reset = true,
						-- })

						-- Load profile config after plugins
						-- lazy.on_done(function()
						-- 	if manager.current_profile.config then
						-- 		pcall(manager.current_profile.config)
						-- 	end
						-- 	vim.notify("Loaded profile: " .. manager.current_profile.name)
						-- end)
					end)
				end)
				return true
			end,
		})
		:find()
end

return M
