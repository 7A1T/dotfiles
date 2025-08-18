return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vscode").setup({
			-- Alternatively set style in setup
			style = "dark",

			-- Enable transparent background
			transparent = false,

			-- Enable italic comment
			italic_comments = true,

			-- Underline `@markup.link.*` variants
			underline_links = true,

			-- Apply theme colors to terminal
			terminal_colors = true,

			-- Override colors (see ./lua/vscode/colors.lua)
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},
		})
		vim.cmd.colorscheme("vscode")
	end,
}
