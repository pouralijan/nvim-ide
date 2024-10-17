function resize()
	-- Get our current buffer number
	local tn = vim.api.nvim_get_current_tabpage()
	local tree_win_handle = nil
	for _, window_handle in ipairs(vim.api.nvim_tabpage_list_wins(tn)) do
		local buffer_handle = vim.api.nvim_win_get_buf(window_handle)
		local buf_name = vim.fn.bufname(buffer_handle)
		local pattern = "neo%-tree.*"
		if string.match(buf_name, pattern) then
			tree_win_handle = window_handle
			break
		end
	end
	if tree_win_handle == nil then
		-- Did not find window for neo-tree, could not reset size.
		return
	end
	local configured_width = require("neo-tree").config.filesystem.window.width or 40
	if vim.api.nvim_win_get_width(tree_win_handle) > configured_width then
		-- Reset neo-tree window size to proper value.
		vim.api.nvim_win_set_width(tree_win_handle, configured_width)
		return
	end
	-- Did not find window in tabpage, could not reset size.
end

return {
	lazy = false,
	"mfussenegger/nvim-dap",

	dependencies = {
		"pouralijan/nvim-dap-projects",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		-- require("core.keymaps").load_mapping(require("core.keymaps").dap)
		require("core.keymaps").dap()
		-- require("nvimui").setup()
		require("nvim-dap-virtual-text").setup({
			display_callback = function(variable)
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)

				if
					name:match("secrect")
					or name:match("api")
					or name:match("pass")
					or value:match("secrect")
					or value:match("api")
					or value:match("pass")
				then
					return " ******* "
				end

				if #value > 10 then
					return " " .. string.sub(value, 1, 10) .. " ... "
				end

				return " " .. value
			end,
		})
		local dap = require("dap")

		dap.listeners.after.event_terminated["dapui_config"] = resize
		dap.listeners.after.event_exited["dapui_config"] = resize

		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end

		-- Extends dap.configurations with entries read from .vscode/launch.json
		if vim.fn.filereadable(".vscode/launch.json") then
			vscode.load_launchjs()
		end
		require("dap-python").setup()
	end,
}
