local comp_caps = require("cmp_nvim_lsp").default_capabilities()

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- provides some UI components
			"j-hui/fidget.nvim", -- provides loading spinner for lsp startup
			"hrsh7th/nvim-cmp", -- completion feature, only needed when running an lsp
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = true,
		config = function()
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = true,
		lazy = true,
	},
	{
		"bashls",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "sh" },
		virtual = true,
		config = function()
			require("lspconfig").bashls.setup({
				capabilities = comp_caps,
			})
		end,
	},
	{
		"gdscript",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "gdscript" },
		virtual = true,
		config = function()
			require("lspconfig").gdscript.setup({
				capabilities = comp_caps,
			})
		end,
	},
	{
		"lua_ls",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "lua" },
		virtual = true,
		config = function()
			require("lspconfig").lua_ls.setup({
				capabilities = comp_caps,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),

							-- remove annoying pop-up, may break some library imports
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
	},
	{
		"intelephense",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "php" },
		virtual = true,
		config = function()
			require("lspconfig").intelephense.setup({
				capabilities = comp_caps,
				init_options = {
					licenceKey = "/home/kfrazer/code/intelephense_license",
				},
				settings = {
					intelephense = {
						format = {
							enable = false,
						},
					},
				},
			})
		end,
	},
	{
		"psalm",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "php" },
		virtual = true,
		enabled = false, -- Currently too memory-heavy
		config = function()
			require("lspconfig").psalm.setup({
				capabilities = comp_caps,
				cmd = {
					"psalm-language-server",
					"--use-ini-defaults",
					"--config=/home/kfrazer/code/vimeo/psalm.xml",
					"--enable-code-actions=false",
					"--enable-autocomplete=false",
					"--enable-provide-hover=false",
					"--enable-provide-signature-help=false",
					"--enable-provide-definition=false",
				},
			})
		end,
	},
	{
		"metals",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "scala" },
		virtual = true,
		config = function()
			require("lspconfig").metals.setup({
				capabilities = comp_caps,
			})
		end,
	},
	{
		"terraformls",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "terraform", "terraform-vars" },
		virtual = true,
		config = function()
			require("lspconfig").terraformls.setup({
				capabilities = comp_caps,
			})
		end,
	},
	{
		"tflint",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "terraform", "terraform-vars" },
		virtual = true,
		config = function()
			require("lspconfig").tflint.setup({
				capabilities = comp_caps,
			})
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "rust" },
		config = function()
			require("rust-tools").setup({
				tools = {
					inlay_hints = {
						auto = false,
					},
				},
				server = {
					capabilities = comp_caps,
					settings = {
						["rust-analyzer"] = {
							check = { command = "clippy" },
							completion = {
								callable = { snippets = "none" },
							},
						},
					},
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = { "typescript", "typescriptreact", "typescript.tsx" },
		config = function()
			require("typescript-tools").setup({
				capabilities = comp_caps,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				settings = {
					separate_diagnostic_server = false,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<space>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				toml = { "prettier" },
				markdown = { "prettier" },
				gdscript = { "gdformat" },
			},
			format_after_save = { lsp_format = "fallback" },
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local builtins = require("null-ls.builtins")

			require("null-ls").setup({
				sources = {
					builtins.diagnostics.actionlint,
					builtins.diagnostics.terraform_validate,
					builtins.formatting.phpcsfixer.with({
						prefer_local = true,
						extra_args = {
							"--config=.php_cs.dist.php",
						},
						timeout = -1,
					}),
					builtins.formatting.prettier.with({
						disabled_filetypes = { "markdown", "markdown.mdx" },
					}),
					builtins.formatting.terraform_fmt,
				},
			})
		end,
	},
	{
		"none-ls-psalm",
		dependencies = {
			"nvimtools/none-ls.nvim",
		},
		virtual = true,
		ft = { "php" },
		config = function()
			local null_ls = require("null-ls")
			local helpers = require("null-ls.helpers")

			local psalm = {
				name = "psalm",
				method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				filetypes = { "php" },
				generator = null_ls.generator({
					command = "psalm",
					args = {
						"--output-format=json",
						"--show-info=true",
						"--no-progress",
						"--use-ini-defaults",
						"--diff",
						"--threads=8",
						"--disable-extension=apc",
						"--disable-extension=protobuf",
						"$FILENAME",
					},
					format = "json_raw",
					from_stderr = true,
					to_temp_file = false,
					check_exit_code = function()
						return false
					end,

					on_output = helpers.diagnostics.from_json({
						attributes = {
							severity = "severity",
							row = "line_from",
							end_row = "line_to",
							col = "column_from",
							end_col = "column_to",
							code = "shortcode",
						},
						severities = {
							info = helpers.diagnostics.severities["information"],
							error = helpers.diagnostics.severities["error"],
						},
					}),
				}),
			}

			null_ls.register(psalm)
		end,
	},
}
