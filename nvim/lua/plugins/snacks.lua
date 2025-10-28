return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
			top_down = false,
		},
		input = { enabled = true },
		picker = {
			enabled = true,
			layout = {
				preset = "default",
			},
			layouts = {
				default = {
					layout = {
						box = "rounded",
						width = 0.7,
						height = 0.7,
						border = "rounded",
					},
					preview = {
						box = "rounded",
					},
				},
				sidebar = {
					layout = {
						box = "rounded",
						width = 0.25,
						height = 1.0,
						x = 0,
						y = 0,
						border = "rounded",
					},
				},
			},
		},
		indent = {
			enabled = true,
			char = "┊",
			only_scope = false,
		},
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = false,
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
			]],
				keys = {
					{ icon = "󰱼 ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
					{ icon = "  ", key = "n", desc = "New File", action = ":ene" },
					{ icon = "  ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
					{ icon = "  ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
					{ icon = " ", key = "c", desc = "Config", action = ":e ~/.config/nvim" },
					{ icon = "󰗐 ", key = "s", desc = "Restore Session", action = ":AutoSession restore" },
					{ icon = "󱥚 ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		lazygit = { enabled = true },
		gitbrowse = { enabled = true },
		git = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true },
			},
		},
	},
	config = function(_, opts)
		local snacks = require("snacks")
		snacks.setup(opts)

		vim.notify = snacks.notifier.notify
	end,
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>cR",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>fP",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find String (Grep)",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer({ layout = "sidebar" })
			end,
			desc = "Toggle File Explorer",
		},
		{
			"<leader>ex",
			function()
				Snacks.explorer({ layout = "default" })
			end,
			desc = "File Explorer",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.git.log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
