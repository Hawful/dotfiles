return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		keys = {
			{ "<leader>t", function() require('telescope.builtin').find_files() end },
			{ "<leader>b", function() require('telescope.builtin').buffers() end },
			{ "<leader>g", function() require('telescope.builtin').live_grep() end },
			{ "<leader>s", function() require('telescope.builtin').grep_string() end,        mode = { "n", "v" } },
			{ "<leader>r", function() require('telescope.builtin').resume() end },
			{ "gr",        function() require('telescope.builtin').lsp_references() end },
			{ "gd",        function() require('telescope.builtin').lsp_definitions() end },
			{ "<C-]>",     function() require('telescope.builtin').lsp_definitions() end },
			{ "gi",        function() require('telescope.builtin').lsp_implementations() end },

		},
		config = function()
			require("telescope").setup({
				defaults = {
					dynamic_preview_title = true
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown()
					}
				}
			})
			require('telescope').load_extension('fzy_native')
			require('telescope').load_extension('ui-select')
		end,
	}
}
