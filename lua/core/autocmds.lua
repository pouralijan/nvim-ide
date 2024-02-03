-- Format on Save

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })

autocmd("InsertLeave", {
	group = "__formatter__",
	command = ":FormatWrite",
})
