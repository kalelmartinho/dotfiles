return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		auto_restore = false,
		auto_save = true,
	},
	keys = {
		{
			"<leader>wr",
			"<cmd>AutoSession restore<CR>",
			desc = "Restore session for cwd",
		},
		{
			"<leader>ws",
			"<cmd>AutoSession save<CR>",
			desc = "Save session for cwd",
		},
	},
}
