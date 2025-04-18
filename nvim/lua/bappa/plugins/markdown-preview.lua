return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>mm",
			"<cmd>MarkdownPreviewToggle<CR>",
			{ desc = "Preview markdown files in browser" }
		)
	end,
}
