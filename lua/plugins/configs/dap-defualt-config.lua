local dap = require("dap")
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
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
