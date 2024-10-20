return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = "VeryLazy",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
						["is"] = "@statement.inner",
						["as"] = "@statement.outer",
						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},
		})
	end,
}
