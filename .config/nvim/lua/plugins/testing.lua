return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang")({
						args = { "-v" },
						experimental = {
							test_table = true,
						},
					}),
				},
				output_panel = {
					enabled = true,
					open = "botright split | resize 15",
				},
				quickfix = {
					open = false,
				},
				status = {
					virtual_text = true,
					signs = true,
				},
			})

			-- Key mappings are configured in core/keymaps.lua
		end,
	},
}
