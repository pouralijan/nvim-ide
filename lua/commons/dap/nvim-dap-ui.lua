return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	event = "VeryLazy",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminateed.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- dap.listeners.after.event_initialized["dapui_config"] = function()
		-- 	dapui.open()
		-- end
		--
		-- dap.listeners.after.event_terminateed["dapui_config"] = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.after.event_exited["dapui_config"] = function()
		-- 	dapui.close()
		-- end
	end,
}
