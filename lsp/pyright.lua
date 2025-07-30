return {
	settings = {
		pyright = {
			analysis = {
				diagnosticMode = "workspace", -- Force full workspace scan
				useLibraryCodeForTypes = true,
			},
		},
		python = {
			analysis = {
				diagnosticMode = "workspace", -- Force full workspace scan
				useLibraryCodeForTypes = true,
			},
		},
	},
    filetyp ={ "python", "py", "pyi", "pyc" },
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		-- require("cmp_nvim_lsp").default_capabilities(),
		{
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		}
	),
}
