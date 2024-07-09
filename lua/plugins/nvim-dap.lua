return {
	lazy = false,
	"mfussenegger/nvim-dap",

	dependencies = {
		{
			"pouralijan/nvim-dap-projects",
		},
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function(_, _)
		require("core.keymaps").load_mapping(require("core.keymaps").dap)
		require("nvim-dap-virtual-text").setup()
		local dap = require("dap")
    dap.set_log_level("WARN")
		dap.adapters.gdb = {
			type = "executable",
			command = "/usr/bin/gdb",
			args = { "-i", "dap" },
		}

		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Debug with gdb",
				type = "gdb",
				requst = "launch",
				program = "${workspaceFolder}",
				cwd = "${workspaceFolder}",
				setopOnEntry = false,
				args = {},
			},
			{
				name = "Debug with lldb",
				type = "lldb",
				requst = "launch",
				program = "${workspaceFolder}",
				cwd = "${workspaceFolder}",
				setopOnEntry = false,
				args = {},
			},
		}
	end,
}
