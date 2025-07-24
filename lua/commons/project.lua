local lopts = {
	exclude_dirs = { "/home/hassan/" },
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	silent_chdir = false,
}
return {
	"ahmedkhalf/project.nvim",
	opts = lopts,
	config = function()
		require("project_nvim").setup(lopts)
	end,
}
