return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		lazy = true,
		config = function()
			local cmp = require("cmp")
			local types = require("cmp.types")

			cmp.setup {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				completion = {
					autocomplete = false,
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = 'symbol',
						maxwidth = 50,
						ellipsis_char = '...',
					})
				},
				mapping = {
					['<C-n>'] = {
						i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
					},
					['<C-p>'] = {
						i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
					},
					['<C-b>'] = {
						i = cmp.mapping.scroll_docs(-4),
					},
					['<C-f>'] = {
						i = cmp.mapping.scroll_docs(4),
					},
					['<C-Space>'] = {
						i = cmp.mapping.complete(),
					},
					['<C-e>'] = {
						i = cmp.mapping.abort(),
					},
					['<CR>'] = {
						i = cmp.mapping.confirm({ select = true }),
					}
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				})
			}
		end
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		version = "1.*",
		build = "make install_jsregexp"
	},
}
