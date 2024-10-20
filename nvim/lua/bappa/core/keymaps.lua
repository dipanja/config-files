-- maaping SpaceBar as leader
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Navigate buffers
keymap.set("n", "<leader>k", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>j", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Save and quit
keymap.set("n", "<leader>ww", "<cmd>wa<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit without saving" })
-- keymap.set('n', '<leader>q', '<C-w>q', {desc = "Quit"})

-- Move text up and down
-- normal mode
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>", { desc = "Move current line 1 up" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>", { desc = "Move current line 1 down" })
-- visual mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move current line 1 up" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move current line 1 down" })

-- replace text
keymap.set("n", "<leader>rr", ":%s///gc<left><left><left><left>", { desc = "Replace the text" })

-- Map a key to toggle hlsearch
-- toggle_highlight function is defined on lua/bappa/core/init.lua file.
keymap.set("n", "<Leader>v", ":lua toggle_highlight()<CR>", { desc = "Toggle heighlight on search" })

--Terminal keymaps
--Close the terminal
keymap.set("t", "<leader><ESC>", "<C-\\><C-n>", { desc = "close the terminal" }, { noremap = true })
--open terminal
keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "open the terminal" }, { noremap = true })

--scrolling
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center" })
