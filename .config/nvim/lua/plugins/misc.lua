-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{ "echasnovski/mini.nvim", version = false },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("coverage").setup({
				lang = {
					go = {
						coverage_file = vim.fn.getcwd() .. "/coverage.out",
					},
				},
			})
		end,
	},
	{
		"fredrikaverpil/godoc.nvim",
		version = "*",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" }, -- optional
			{
				"nvim-treesitter/nvim-treesitter",
				opts = {
					ensure_installed = { "go" },
				},
			},
		},
		build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
		cmd = { "GoDoc" },                                           -- optional
		opts = {},
	},
}
