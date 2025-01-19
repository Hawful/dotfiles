vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.textwidth = 100
vim.o.foldenable = false
vim.o.mouse = ""
vim.o.showmode = false
vim.o.complete = ".,w,b,u,t,i"
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true

-- Clear search highlight with esc in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
--
-- plugin manager
--

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- initialize plugins
require("lazy").setup("plugins", { change_detection = { notify = false } })
