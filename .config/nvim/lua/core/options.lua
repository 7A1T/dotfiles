-- Display
vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = false
vim.wo.signcolumn = "yes"
vim.o.numberwidth = 4
vim.opt.termguicolors = true
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.conceallevel = 0

-- Text handling
vim.o.wrap = false
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.whichwrap = "bs<>[]hl"
vim.o.clipboard = "unnamedplus"

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Scrolling
vim.o.scrolloff = 2
vim.o.sidescrolloff = 8

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Files & backup
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.fileencoding = "utf-8"

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Completion
vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = '1'

-- Set up folding with treesitter and fallbacks
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Try treesitter folding first
    local has_treesitter, _ = pcall(vim.treesitter.get_parser, 0)
    if has_treesitter then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    else
      -- Fallback to indent-based folding for files without treesitter support
      vim.wo.foldmethod = 'indent'
    end
  end,
})

-- Misc
vim.o.mouse = "a"
vim.o.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
vim.diagnostic.config({ jump = { float = true } })
