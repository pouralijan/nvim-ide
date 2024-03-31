return {
	settings = {
		rust_analyzer = {
			cmd = { "rustup", "run", "stable", "rust-analyzer" },
			cargo = {
				allFeatures = true,
			},
		},
	},
}
