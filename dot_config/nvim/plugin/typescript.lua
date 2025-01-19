-- only indent by two spaces
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"typescript",
		"typescriptreact",
	},
	callback = function()
		local o = vim.opt_local
		o.tabstop = 2
		o.shiftwidth = 2
		o.softtabstop = 2
	end,
})
