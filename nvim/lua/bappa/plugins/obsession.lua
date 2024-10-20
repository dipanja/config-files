return {
	"tpope/vim-obsession",
	config = function()
		vim.keymap.set("n", "<leader>ss", ":source Session.vim <cr>", { desc = "load Session" })
	end,
} -- session management
