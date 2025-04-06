return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					n = {
						["d"] = actions.delete_buffer,
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				lsp_document_symbols = {},
			},
			extensions = {},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find string in cwd" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
			{ desc = "Find open files in buffer" }
		)
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Telescope help" })
		keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "lsp document symbols" })
		keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find marks in all buffers" })
	end,
}
