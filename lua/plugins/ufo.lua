vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- local options = {}
local ftMap = {
	vim = "indent",
	python = { "lsp", "indent" },
	git = "",
	cpp = { "lsp", "syntax" },
}

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

return {
	lazy = false,
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	opts = {
		-- open_fold_hl_timeout = 100,
		fold_virt_text_handler = handler,
		provider_selector = function(bufnr, filetype, buftype)
			-- if you prefer treesitter provider rather than lsp,
			return ftMap[filetype] or { "treesitter", "indent" }
			-- refer to ./doc/example.lua for detail
		end,
	},
	config = function(_, opts)
		require("ufo").setup(opts)
		require("core.keymaps").ufo()
	end,
}
