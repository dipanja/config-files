return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.opt.conceallevel = 2
		-- Add custom keymaps
		vim.keymap.set("n", "<leader>oo", ":ObsidianTemplate ", { desc = "add template", noremap = true })

		require("obsidian").setup({
			dir = "/media/bappa/DATA/obsidian",
			notes_subdir = "notes",
			new_notes_location = "current_dir",

			-- Customize the note ID generation
			note_id_func = function(title)
				-- Keep spaces in the ID
				return title
			end,

			-- Customize how note file names are generated
			note_path_func = function(spec)
				-- Replace spaces with underscores in the file name
				-- local file_name = spec.title:gsub(" ", "_")
				local file_name = spec.title
				local path = spec.dir / file_name
				return path:with_suffix(".md")
			end,

			-- templates
			templates = {
				folder = "templates",
				date_format = "%d-%m-%Y",
				time_format = "%H:%M",
			},

			completion = {
				nvim_cmp = true,
				min_chars = 2,
				new_notes = true,
				link_text = true,
				link_targets = true,
			},
		})
	end,
}
