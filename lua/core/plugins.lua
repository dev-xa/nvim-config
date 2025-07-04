local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({
    "zbirenbaum/dox.nvim",
    config = function()
      require("dox").setup({
        mappings = {
          doc_block = "<leader>dc",   -- create doc block above current line
          doc_current = "<leader>do", -- document current line (if function)
        },
      })
    end,
  })

  ----------------------------------------------------------------
  -- ✅ LSP + Autocompletion Plugins
  ----------------------------------------------------------------
  use {
    'williamboman/mason.nvim',
    run = function()
      pcall(vim.cmd, "MasonUpdate")
    end
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  ----------------------------------------------------------------

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
