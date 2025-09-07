return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				-- Disable gopls since we already have it configured
				gopls_cmd = nil,
				gopls_remote_auto = false,
				
				-- Go formatting
				goimports = "gopls", -- Use gopls for imports (consistent with your setup)
				gofmt = "gofumpt", -- Use gofumpt (you already have this in null-ls)
				
				-- Test settings
				run_in_floaterm = false, -- Use your existing terminal setup
				test_runner = "go", -- Use standard go test (works with neotest)
				
				-- Struct tags
				tag_transform = "camelcase", -- Transform field names to camelCase for json tags
				tag_options = "json=omitempty", -- Default options for tags
				
				-- Debugging (integrate with your existing DAP setup)
				dap_debug = false, -- Don't override your existing DAP config
				dap_debug_gui = false,
				
				-- Code generation
				fillstruct = "fillstruct", -- Tool for filling struct literals
				
				-- Interface implementation
				impl_template = {
					f = "// {{.Name}} implements {{.Interface}}\nfunc ({{.Recv}} {{.Type}}) {{.Name}}({{.Params}}) {{.Results}} {\n\t{{.Body}}\n}",
				},
				
				-- Linting (disable since you have null-ls setup)
				lsp_cfg = false,
				lsp_gofumpt = false,
				lsp_on_attach = false,
				
				-- Icons
				icons = {
					breakpoint = "🔴",
					currentpos = "🔵",
				},
				
				-- Trouble integration (if you add it later)
				trouble = false,
				
				-- Disable features that conflict with your setup
				lsp_document_formatting = false,
				lsp_inlay_hints = {
					enable = false, -- Let gopls handle this
				},
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- Install/update all Go tools
	},
}