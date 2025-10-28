return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		"rafi/neoconf-venom.nvim",
		"folke/snacks.nvim",
	},
	config = function()
		require("neoconf").setup()
		local venom = require("venom")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		venom.setup({
			echo = true,
			symbol = "🐍",
			venv_patterns = { "venv", ".venv", ".python-version" },
			use_tools = true,
			tools = {
				pipenv = { "pipenv", "--venv" },
				poetry = { "poetry", "env", "info", "-p" },
			},
			plugins = {
				pyright = function(venv_path)
					return {
						python = {
							pythonPath = table.concat({ venv_path, "bin", "python" }, "/"),
						},
					}
				end,
				pylsp = function(venv_path)
					return {
						pylsp = {
							plugins = { jedi = { environment = venv_path } },
						},
					}
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local snacks = require("snacks")

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", function()
					snacks.picker.lsp_references()
				end, opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", function()
					snacks.picker.lsp_definitions()
				end, opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", function()
					snacks.picker.lsp_implementations()
				end, opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", function()
					snacks.picker.lsp_type_definitions()
				end, opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", function()
					snacks.picker.diagnostics()
				end, opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".luarc.jsonc", "selene.toml", "stylua.toml" },
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.config("svelte", {
			cmd = { "svelteserver", "--stdio" },
			filetypes = { "svelte" },
			root_markers = { "package.json", "tsconfig.json" },
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					buffer = bufnr,
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})

		vim.lsp.config("graphql", {
			cmd = { "graphql-lsp", "server", "-m", "stream" },
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			root_markers = { ".graphqlconfig", ".graphqlconfig.js" },
			capabilities = capabilities,
		})

		vim.lsp.config("emmet_ls", {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
				"vue",
			},
			root_markers = { ".emmet" },
			capabilities = capabilities,
		})

		require("mason-lspconfig").setup({
			automatic_enable = true,
		})
	end,
}
