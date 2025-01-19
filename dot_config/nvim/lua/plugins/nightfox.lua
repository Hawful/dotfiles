return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		opts = {
			palettes = {
				-- Custom duskfox with black background
				nightfox = {
					bg1 = "#000000", -- Black background
					bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
					bg3 = "#121820", -- 55% darkened from stock
					sel0 = "#131b24", -- 55% darkened from stock
				},
			},
			specs = {
				all = {
					inactive = "bg0", -- Default value for other styles
				},
				nightfox = {
					inactive = "#090909", -- Slightly lighter then black background
				},
			},
			groups = {
				all = {
					NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
				},
			},
		},
		init = function()
			vim.cmd.colorscheme("nightfox")
		end,
	}
}
