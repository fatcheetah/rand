vim.g.netrw_banner = 1
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3

vim.opt.path = vim.opt.path + "**"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = a

vim.cmd('colorscheme default')
vim.api.nvim_set_hl(0, "Normal", { ctermbg=None})
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg=None})
print("init self complete")
