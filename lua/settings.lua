local arrows = require("icons").arrows

vim.opt.guicursor = ""

-- Set <space> as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use an indentation of 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode.
vim.o.mouse = "a"

-- UI characters.
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	foldclose = arrows.right,
	foldopen = arrows.down,
	foldsep = " ",
	msgsep = "─",
}

-- Sync clipboard between the OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Save undo history.
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = "yes"

-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15

-- Diff mode settings.
-- Setting the context to a very large number disables folding.
vim.opt.diffopt:append("vertical,context:99")

vim.opt.shortmess:append({
	w = true,
	s = true,
})

-- Status line.
vim.o.laststatus = 3
vim.o.cmdheight = 1

vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.wrap = false
