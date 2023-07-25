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


-- bootstrap lazy.nvim https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',                       -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require('utils')
require('config')
require('keymaps')
require('lsp')

require('plugins/cmp')
require('plugins/treesitter')
require('plugins/gitsigns')
require('plugins/lspconfig')
require('plugins/lualine')
require('plugins/mason')
require('plugins/telescope')

require('lazy').setup({
  --------------------------------------------- Themes

  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme nightfox')
    end
  },

  --- Shared dependencies
  { 'nvim-lua/plenary.nvim', lazy = false },
  { 'kyazdani42/nvim-web-devicons', lazy = false, opts = { default = true } },

  ----------------------------------------- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',              -- Highlight, edit, and navigate code
    build = ':TSUpdate',
    config = config_treesitter,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',  -- Additional textobjects for treesitter
    dependencies = { 'nvim-treesitter' },
  },

  ---------------------- Text Editing, File Management 

  'tpope/vim-abolish',                              -- :Subvert et al
  'tpope/vim-eunuch',                               -- :Move, :Rename et al
  'mattn/emmet-vim',                                -- HTML zencoding
  {
    'windwp/nvim-autopairs',                        -- Smart handling of pairs of quotes, brackets, etc
    event = 'InsertEnter',
    opts = {},
  },
  {
    'kylechui/nvim-surround',                       -- vim-surround for nvim
    version = '*',
    event = 'VeryLazy',
    opts = {}
  },
  {
    'Wansmer/treesj',                               -- splitjoin.vim for neovim
    opts = {
      use_default_keymaps = false,
      max_join_length = 9999,
    },
  },
  {
    'numToStr/Comment.nvim',                        -- Comment / uncomment lines
    opts = {},
  },

  ------------------------------------------------- UI

  {
    'nvim-telescope/telescope.nvim',                -- Fuzzy finder for files, words, etc
    config = config_telescope,
  },
  {
    'akinsho/bufferline.nvim',                      -- Fancy tabs
    opts = {
      options = {
        mode = 'tabs',
        diagnostics = 'nvim-lsp',
        separator_style = 'slant',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',                      -- git status in sign column
    config = config_gitsigns,
  },
  {
    'nvim-lualine/lualine.nvim',                    -- Status line
    config = config_lualine,
  },
  {
    'NvChad/nvim-colorizer.lua',                    -- Colorize hex and others
    opts = {},
  },
  {
    'folke/which-key.nvim',                         -- View possible keybindings
    opts = {},
  },

  --------------------------- LSP Support, Diagnostics

  {
    'williamboman/mason.nvim',                      -- Installer for LSP servers, DAP, linters, and formatters
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',            -- Configurations for a number of popular languages and ecosystems
    config = config_mason_lspconfig,
  },
  {
    'neovim/nvim-lspconfig',                        -- Collection of configurations for built-in LSP clienIt
    config = config_lspconfig,
  },
  {
    'folke/lsp-colors.nvim',                        -- LSP colors
    opts = {},
  },
  {
    'folke/trouble.nvim',                           -- Show LSP diagnostics inline and in a dedicated window
    opts = { use_diagnostic_signs = true },
  },

  ---------------------------------------- Completion

  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
    config = config_cmp,
  },
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',

  ------------------------------- Linting, formatting
  {
    'jose-elias-alvarez/null-ls.nvim',              -- Linters, formatters
    config = config_null_ls,
  },
})
