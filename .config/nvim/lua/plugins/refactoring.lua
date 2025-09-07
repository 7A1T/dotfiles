return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {},
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					go = true,
				},
				prompt_func_param_type = {
					go = true,
				},
				show_success_message = true,
			})
		end,
	},
}
