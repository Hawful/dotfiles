return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup {
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				}
			}
		end,
	},
	{
		"tpope/vim-fugitive"
	},
	{
		"dkarter/bullets.vim",
		ft = { "markdown" },
	},
	{
		"ethanholz/nvim-lastplace",
		opts = {
			lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
			lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'ruby', 'gdscript' },
			},
			indent = { enable = true, disable = { 'ruby', 'gdscript' } },
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim"
		},
		opts = {
			ensure_installed = { "rust_analyzer" },
			automatic_installation = true,
		},
		lazy = true,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			indent = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
		},
	},
}
