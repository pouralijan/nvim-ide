-- Format on Save

local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

augroup("__formatter__", { clear = true })

autocmd("InsertLeave", {
	group = "__formatter__",
	command = ":FormatWrite",
})
