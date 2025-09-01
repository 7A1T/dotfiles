-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)   -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)      -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)      -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)     --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Folding
vim.keymap.set("n", "zR", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "zM", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "zr", "zr", { desc = "Reduce fold level" })
vim.keymap.set("n", "zm", "zm", { desc = "Increase fold level" })
vim.keymap.set("n", "za", "za", { desc = "Toggle fold under cursor" })
vim.keymap.set("n", "zo", "zo", { desc = "Open fold under cursor" })
vim.keymap.set("n", "zc", "zc", { desc = "Close fold under cursor" })
vim.keymap.set("n", "zj", "zj", { desc = "Move to next fold" })
vim.keymap.set("n", "zk", "zk", { desc = "Move to previous fold" })
vim.keymap.set("n", "<leader>zf", "<cmd>set foldlevel=0<CR>", { desc = "Fold everything" })
vim.keymap.set("n", "<leader>zo", "<cmd>set foldlevel=99<CR>", { desc = "Open all folds" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- ToggleTerm: Open float terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)

-- ToggleTerm: Open vertical terminal
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)

-- ToggleTerm: Open tab terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", opts)

-- ===================================================================
-- DEBUGGING (DAP)
-- ===================================================================
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<leader>ds", function()
	require("dap").step_over()
end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_out()
end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "DAP: Terminate" })
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "DAP: Toggle UI" })

-- Go-specific debugging
vim.keymap.set("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { desc = "DAP: Debug Go Test" })
vim.keymap.set("n", "<leader>dgl", function()
	require("dap-go").debug_last()
end, { desc = "DAP: Debug Last Go Test" })

-- ===================================================================
-- TESTING (Neotest)
-- ===================================================================
vim.keymap.set("n", "<leader>trn", function()
	require("neotest").run.run()
end, { desc = "Test: Run Nearest" })
vim.keymap.set("n", "<leader>trf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Test: Run File" })
vim.keymap.set("n", "<leader>trs", function()
	require("neotest").summary.toggle()
end, { desc = "Test: Toggle Summary" })
vim.keymap.set("n", "<leader>tro", function()
	require("neotest").output.open()
end, { desc = "Test: Open Output" })
vim.keymap.set("n", "<leader>trp", function()
	require("neotest").output_panel.toggle()
end, { desc = "Test: Toggle Output Panel" })
vim.keymap.set("n", "<leader>trw", function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end, { desc = "Test: Toggle Watch" })

-- ===================================================================
-- REST CLIENT
-- ===================================================================
vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "REST: Run request under cursor" })
vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "REST: Re-run last request" })

-- ===================================================================
-- NEO-TREE (File Explorer)
-- ===================================================================
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", { desc = "Neo-tree: Toggle file explorer" })
vim.keymap.set("n", "<leader>ngs", ":Neotree float git_status<CR>", { desc = "Neo-tree: Open git status" })
vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = "Neo-tree: Reveal current file" })

-- ===================================================================
-- COMMENT.NVIM
-- ===================================================================
vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Comment: Toggle line" })
vim.keymap.set(
	"v",
	"<C-_>",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ desc = "Comment: Toggle selection" }
)

-- ===================================================================
-- TELESCOPE (Search)
-- ===================================================================
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", function()
	require("telescope.builtin").builtin()
end, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", function()
	require("telescope.builtin").grep_string()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", function()
	require("telescope.builtin").diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function()
	require("telescope.builtin").resume()
end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", function()
	require("telescope.builtin").oldfiles()
end, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").buffers()
end, { desc = "[ ] Find existing buffers" })

-- Telescope advanced searches
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- ===================================================================
-- DATABASE (vim-dadbod)
-- ===================================================================
vim.keymap.set("n", "<leader>dbu", "<cmd>DBUIToggle<cr>", { desc = "Database: Toggle UI" })
vim.keymap.set("n", "<leader>dbf", "<cmd>DBUIFindBuffer<cr>", { desc = "Database: Find Buffer" })
vim.keymap.set("n", "<leader>dbr", "<cmd>DBUIRenameBuffer<cr>", { desc = "Database: Rename Buffer" })
vim.keymap.set("n", "<leader>dbl", "<cmd>DBUILastQueryInfo<cr>", { desc = "Database: Last Query Info" })

-- ===================================================================
-- TMUX nav (tmux integration)
-- ===================================================================
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
