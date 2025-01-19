return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup {
				options = {
					theme = 'jellybeans',
					icons_enabled = false,
					section_separators = '',
					component_separators = '|',
				},
				sections = {
					lualine_b = { "diagnostics" },
					lualine_c = {
						{
							"filename",
							newfile_status = true,
							path = 1,
						}
					},
				},
				inactive_sections = {
					lualine_c = {
						{
							"filename",
							path = 1,
							shorting_target = 10,
						}
					},
				},
				extensions = { "quickfix" },
			}
		end
	},
}
