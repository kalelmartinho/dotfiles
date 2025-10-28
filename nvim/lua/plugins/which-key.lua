return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "modern",
		delay = 200,
		plugins = {
			marks = true,
			registers = true,
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			no_overlap = true,
			padding = { 1, 2 },
			title = true,
			title_pos = "center",
			zindex = 1000,
		},
		layout = {
			width = { min = 20, max = 50 },
			spacing = 3,
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			{ "<leader>f", group = "find", icon = "󰱼 " },
			{ "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", desc = "Files" },
			{ "<leader>fs", "<cmd>lua Snacks.picker.grep()<CR>", desc = "String (Grep)" },
			{ "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "Buffers" },
			{ "<leader>fr", "<cmd>lua Snacks.picker.recent()<CR>", desc = "Recent Files" },
			{ "<leader>fg", "<cmd>lua Snacks.picker.git_files()<CR>", desc = "Git Files" },
			{ "<leader>fh", "<cmd>lua Snacks.picker.help()<CR>", desc = "Help" },
			{ "<leader>fm", "<cmd>lua Snacks.picker.marks()<CR>", desc = "Marks" },
			{ "<leader>fk", "<cmd>lua Snacks.picker.keymaps()<CR>", desc = "Keymaps" },
			{ "<leader>fP", "<cmd>lua Snacks.picker.projects()<CR>", desc = "Projects" },

			{ "<leader>e", group = "explorer", icon = "󰉋 " },
			{ "<leader>ee", "<cmd>lua Snacks.explorer({ layout = 'sidebar' })<CR>", desc = "Sidebar" },
			{ "<leader>ex", "<cmd>lua Snacks.explorer({ layout = 'default' })<CR>", desc = "Full" },

			{ "<leader>g", group = "git", icon = " " },
			{ "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", desc = "Lazygit" },
			{ "<leader>gb", "<cmd>lua Snacks.git.blame_line()<CR>", desc = "Blame Line" },
			{ "<leader>gl", "<cmd>lua Snacks.picker.git_log()<CR>", desc = "Log" },
			{ "<leader>gs", "<cmd>lua Snacks.git.log_line()<CR>", desc = "Log Line" },
			{ "<leader>gB", "<cmd>lua Snacks.gitbrowse()<CR>", desc = "Browse" },

			{ "<leader>c", group = "code", icon = " " },
			{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
			{ "<leader>cR", "<cmd>lua Snacks.rename.rename_file()<CR>", desc = "Rename File" },

			{ "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Diagnostics Line" },
			{ "<leader>D", "<cmd>lua Snacks.picker.diagnostics()<CR>", desc = "Diagnostics Buffer" },

			{ "<leader>n", "<cmd>lua Snacks.notifier.show_history()<CR>", desc = "Notifications" },

			{ "<leader>s", group = "session", icon = "󰁯 " },
			{ "<leader>sr", "<cmd>AutoSession restore<CR>", desc = "Restore" },
			{ "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save" },

			{ "<leader>t", group = "tabs", icon = " " },
			{ "<leader>to", "<cmd>tabnew<CR>", desc = "New Tab" },
			{ "<leader>tx", "<cmd>tabclose<CR>", desc = "Close Tab" },
			{ "<leader>tn", "<cmd>tabn<CR>", desc = "Next Tab" },
			{ "<leader>tp", "<cmd>tabp<CR>", desc = "Previous Tab" },
			{ "<leader>tf", "<cmd>tabnew %<CR>", desc = "Open in Tab" },

			{ "<leader>.", "<cmd>lua Snacks.scratch()<CR>", desc = "Scratch Toggle" },
			{ "<leader>S", "<cmd>lua Snacks.scratch.select()<CR>", desc = "Scratch Select" },

			{ "<leader>b", group = "buffer", icon = "󰖯 " },
			{ "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", desc = "Delete" },

			{ "<leader>u", group = "ui", icon = "󰙵 " },
			{ "<leader>un", "<cmd>lua Snacks.notifier.hide()<CR>", desc = "Dismiss Notifications" },

			{ "<leader>s", group = "split", icon = " " },
			{ "<leader>sv", "<C-w>v", desc = "Vertical" },
			{ "<leader>sh", "<C-w>s", desc = "Horizontal" },
			{ "<leader>se", "<C-w>=", desc = "Equal Size" },
			{ "<leader>sx", "<cmd>close<CR>", desc = "Close" },

			{ "<leader>tt", "<cmd>lua Snacks.terminal()<CR>", desc = "Toggle Terminal" },

			{ "<leader>nh", "<cmd>nohl<CR>", desc = "Clear Highlights" },
			{ "<leader>+", "<C-a>", desc = "Increment" },
			{ "<leader>-", "<C-x>", desc = "Decrement" },

			{ "<leader>?", "<cmd>lua require('which-key').show({ global = false })<CR>", desc = "Keymaps" },
		})
	end,
}
