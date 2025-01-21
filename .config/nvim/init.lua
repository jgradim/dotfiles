-------------------------------------------------------------------------------
--- Bootstrap lazy.nvim
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
--- Configuration and keymaps
-------------------------------------------------------------------------------

require('config')
require('keymaps')

-------------------------------------------------------------------------------
--- Install and configure plugins using lazy.nvim
-------------------------------------------------------------------------------

require('lazy').setup({
  ----------------------------------------------------------------------------- Theme
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
      vim.cmd('colorscheme nightfox')
    end
  },

  ----------------------------------------------------------------------------- Shared dependencies

  { 'nvim-lua/plenary.nvim', lazy = false },
  { 'nvim-tree/nvim-web-devicons', lazy = false, opts = { default = true } },
  {
    'nvim-treesitter/nvim-treesitter',              -- Highlight, edit, and navigate code
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',  -- Additional textobjects for treesitter
    dependencies = { 'nvim-treesitter' },
  },

  ----------------------------------------------------------------------------- Text editing, file management

  'tpope/vim-abolish',                              -- :Subvert et al
  'tpope/vim-eunuch',                               -- :Move, :Rename, et al
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

  ----------------------------------------------------------------------------- UI

  {
    "ibhagwan/fzf-lua",                                   -- Fuzzy finder for files, words, etc
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        mode = 'tabs',
      }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'nordfox', -- nord
      },
      sections = {
        lualine_b = {'diagnostics'},
        lualine_c = { {
          'filename',
          path = 1
        } },
      },
      inactive_sections = {
        lualine_c = {'filename'}
      },
    }
  },
  {
    'folke/trouble.nvim',
    -- cmd = 'Trouble',
    opts = {},
  },

  ----------------------------------------------------------------------------- Completion, LSP

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'neovim/nvim-lspconfig',
  {
    'saghen/blink.cmp',

    -- use a release tag to download pre-built binaries
    version = '*',

    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'enter' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      completion = {
        list = { selection = { preselect = true, auto_insert = false } },

        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
            }
          }
        },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 200 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = false },
      },

      sources = {
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- Disable cmdline completions
        cmdline = {},
      },

      -- Use a preset for snippets, check the snippets documentation for more information
      -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },

      -- Experimental signature help support
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' }
  },

  ----------------------------------------------------------------------------- Linting, formatting

  -- 'mfussenegger/nvim-lint',
  'stevearc/conform.nvim',
})

-------------------------------------------------------------------------------
--- Post plugin install configurations
-------------------------------------------------------------------------------

require('lsp')
-- require('lint')
require('fmt')
