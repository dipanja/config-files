return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "night",
			-- style = "dark",
			transparent = true, -- set transparent background
			styles = {
				sidebars = "transparent", -- set transparent sidebars
				floats = "moon",
				comments = { italic = true },
				keyworgs = { italic = true },
			},
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
