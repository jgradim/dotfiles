-- General guides
--   https://github.com/nanotee/nvim-lua-guide
--   https://neovide.dev/configuration.html
--
-- Neovim from scratch, from the creator of LunarVim
--   https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ
-- 
-- Requires:
--   A patched font - https://www.nerdfonts.com/#home
--   ESLint - npm i -g eslint
--   StyLua - cargo 
--
-- Heavily inspired by NvChad, LunarVim, AstroNvim
-- 
-- Huge list of plugins / themes
--   https://morioh.com/p/a7063de46490

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Shared dependencies
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Plugins
  use 'akinsho/bufferline.nvim'                      -- Fancy tabs
  use 'numToStr/Comment.nvim'                        -- Comment / uncomment lines
  use 'lewis6991/gitsigns.nvim'                      -- git status in sign column
  use 'nvim-lualine/lualine.nvim'                    -- Status line
  use 'NvChad/nvim-colorizer.lua'                    -- Colorize hex and others
  use 'windwp/nvim-autopairs'                        -- Smart handling of pairs of quotes, brackets, etc
  use 'kylechui/nvim-surround'                       -- vim-surround for nvim
  use 'nvim-telescope/telescope.nvim'                -- Fuzzy finder for files, words, etc
  use 'nvim-treesitter/nvim-treesitter'              -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- Additional textobjects for treesitter
  use 'folke/which-key.nvim'                         -- View possible keybindings
  use 'tpope/vim-abolish'                            -- :Subvert et al
  use 'tpope/vim-eunuch'                             -- :Move, :Rename et al

  -- Linting, formatting
  use 'jose-elias-alvarez/null-ls.nvim'              -- Linters, formatters

  -- LSP Support, Diagnostics                        
  use 'williamboman/mason.nvim'                      -- Installer for LSP servers, DAP, linters, and formatters
  use 'williamboman/mason-lspconfig.nvim'            -- Configurations for a number of popular languages and ecosystems
  use 'neovim/nvim-lspconfig'                        -- Collection of configurations for built-in LSP client
  use 'folke/lsp-colors.nvim'                        -- LSP colors
  use 'folke/trouble.nvim'                           -- Show LSP diagnostics inline and in a dedicated window

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'

  -- Themes
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Load (n)vim configuration
require('config')

-- Linting, formatting
require('plugins/null-ls')

-- LSP
require('plugins/lsp')

-- Load shared dependencies configurations
require('plugins/nvim-web-devicons')

-- Load plugin configurations
require('plugins/bufferline')
require('plugins/cmp')
require('plugins/comment')
require('plugins/colorizer')
require('plugins/gitsigns')
require('plugins/lualine')
require('plugins/nvim-autopairs')
require('plugins/nvim-surround')
require('plugins/nvim-treesitter')
require('plugins/telescope')
require('plugins/trouble')
require('plugins/which-key')

-- Load keymaps
require('keymaps')

-- Load themes
-- require('themes/onedark')
-- require('themes/nord')
require('themes/nightfox')
