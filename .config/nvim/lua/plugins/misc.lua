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
		-- High-performance color highlighter (latest maintained version)
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background", -- Available modes: foreground, background, virtualtext
				virtualtext = "■",
				always_update = false,
			},
			filetypes = {
				"*", -- Enable for all filetypes
				css = { css = true, css_fn = true, },
				html = { names = false, },
			},
		},
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
	{
		-- Project-wide find and replace with live preview
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = {
			open_cmd = "noswapfile vnew",
			live_update = false, -- auto execute search again when you write to any file
			line_sep_start = "┌-----------------------------------------",
			result_padding = "¦  ",
			line_sep = "└-----------------------------------------",
			highlight = {
				ui = "String",
				search = "DiffChange",
				replace = "DiffDelete",
			},
		},
	},
}
