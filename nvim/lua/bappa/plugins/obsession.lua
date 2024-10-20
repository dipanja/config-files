return {
	"tpope/vim-obsession",
	config = function()
		vim.keymap.set("n", "<leader>ss", ":source Session.vim<cr>", { desc = "load Session" })
		vim.keymap.set("n", "<leader>ms", ":Obsession<cr>", { desc = "Session init" })
	end,
} -- session management
