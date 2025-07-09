vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

require("nvim-tree").setup({
  git = {
    enable = true,
    ignore = false, -- show files even if they're in .gitignore
  }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.cmd([[
      setlocal foldmethod=indent
      setlocal foldenable
      setlocal foldlevel=99
      setlocal foldlevelstart=99
    ]])
  end,
})

-- Enable Tree-sitter folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99      -- show all folds when opening file
vim.o.foldlevelstart = 99 -- don't fold everything at start

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
