local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP=fn.system({'git','clone','--depth','1','https://github.com/wbthomason/packer.nvim',install_path})
  vim.cmd('packadd packer.nvim')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install here
return require('packer').startup(function(use)
  -- Let packer manage itself, have it depend on some common stuff
  use { 'wbthomason/packer.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    }
  }

  -- Navigation
  use { 'phaazon/hop.nvim' }

  -- Notifications
  use { 'rcarriga/nvim-notify' }

  -- Colorschemes
  use { 'mofiqul/dracula.nvim' }
  use { 'lunarvim/darkplus.nvim' }
  use { 'ellisonleao/gruvbox.nvim' }

  -- Buffer closer
  use { 'moll/vim-bbye' }

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Project management
  use { 'ahmedkhalf/project.nvim' }

  -- Bufferline
  use { 'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Lualine
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Treesitter syntax highlighter
  use { 'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' }
  }

  --LSP
  use { 'neovim/nvim-lspconfig' }
  --use { 'ray-x/lsp_signature.nvim' }
  use { 'tami5/lspsaga.nvim' }

  -- Autocomplete with LSP and luasnip
  use { 'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-path' },

      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use { 'jose-elias-alvarez/null-ls.nvim' } -- Null LS for extras

  --Telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- GIT highlighter
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Color highlighter
  use { 'norcalli/nvim-colorizer.lua' }

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
