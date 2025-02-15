return {
	"3rd/image.nvim",
	ft = "markdown",
	build = false, -- important: skip rock installation as we're using magick_cli
	opts = {
		backend = "kitty",
		processor = "magick_cli",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown" },
			},
		},
		max_width_window_percentage = 30,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = true,
		tmux_show_only_in_active_window = true,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
	},
}
