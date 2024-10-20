vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight Normal ctermbg=none ]])

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})

local opt = vim.opt

opt.backup = false -- creates a backup file
opt.swapfile = false -- turn off swapfile
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.clipboard = "unnamedplus" -- use system clipboard
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a" -- allow the mouse to be used in Nvim
opt.guifont = "monospace:h19" -- the font used in graphical neovim applications

-- Tab
opt.tabstop = 2 -- number of visual spaces per TAB
opt.softtabstop = 2 -- number of spacesin tab when editing
opt.shiftwidth = 2 -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
opt.number = true -- show absolute number
opt.relativenumber = true -- add numbers to each line on the left side

-- Searching
opt.incsearch = true -- search as characters are entered
opt.hlsearch = false -- highlight matches
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Scrolling
opt.scrolloff = 2

-- terminal GUI colors
opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
opt.cursorline = true -- enable coursorline

-- split window options.
opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right
