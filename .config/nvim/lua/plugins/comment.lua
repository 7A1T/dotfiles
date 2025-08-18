-- Easily comment visual regions/lines
return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		-- Keymaps are configured in core/keymaps.lua
	end,
}
