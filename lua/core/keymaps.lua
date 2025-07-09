vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.doge_enable_mappings = 1
vim.g.doge_mapping = "<leader>dc"

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]]

