return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio", -- Required dependency for dap-ui
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup dap-python
		require("dap-python").setup("uv")

		-- Setup dap-ui
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Expand lines larger than the window
			-- Requires >= 0.7
			expand_lines = vim.fn.has("nvim-0.7") == 1,
			-- Layouts define sections of the screen to place windows.
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						{ id = "scopes", size = 0.5 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40, -- 40 columns
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25, -- 25% of total lines
					position = "bottom",
				},
			},
			controls = {
				-- Requires Neovim nightly (or 0.8 when released)
				-- Enabled by default for nightly
				-- Disabled by default for stable
				enabled = true,
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
			},
		})

		-- Automatically open/close dap-ui
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Key mappings for debugging
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Conditional Breakpoint" })

		-- Toggle dap-ui manually
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result" })

		-- Python-specific configurations
		table.insert(dap.configurations.python, {
			type = "python",
			request = "launch",
			name = "Launch file with arguments",
			program = "${file}",
			args = function()
				local args_string = vim.fn.input("Arguments: ")
				return vim.split(args_string, " ")
			end,
			console = "integratedTerminal",
		})

		table.insert(dap.configurations.python, {
			type = "python",
			request = "launch",
			name = "Django",
			program = vim.fn.getcwd() .. "/manage.py",
			args = { "runserver" },
			console = "integratedTerminal",
		})
	end,
}
