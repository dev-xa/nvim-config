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
  ----------------------------------------------------------------
  -- 📦 Package Manager
  ----------------------------------------------------------------
  use 'wbthomason/packer.nvim'

  ----------------------------------------------------------------
  -- 🎨 UI / Themes
  ----------------------------------------------------------------
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  ----------------------------------------------------------------
  -- 🌲 Treesitter
  ----------------------------------------------------------------
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle'
  }

  ----------------------------------------------------------------
  -- 🔍 Telescope (Fuzzy Finder)
  ----------------------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  ----------------------------------------------------------------
  -- 📄 Documentation Generator
  ----------------------------------------------------------------
  use({
    "kkoomen/vim-doge",
    run = ":call doge#install()"
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

  -- lazy.nvim or packer users
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  ----------------------------------------------------------------
  -- 🔄 Sync if fresh install
  ----------------------------------------------------------------
  if packer_bootstrap then
    require('packer').sync()
  end
end)
