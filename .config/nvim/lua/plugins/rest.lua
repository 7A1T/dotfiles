return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { "luarocks.nvim" },
		ft = "http",
		config = function()
			require("rest-nvim").setup({
				result = {
					split_horizontal = false,
					split_in_place = false,
					skip_ssl_verification = false,
					show_url = true,
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
				},
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})

			-- Key mappings are configured in core/keymaps.lua
		end,
	},
}