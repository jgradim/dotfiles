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
    dependencies = { "nvim-tree/nvim-web-devicons" },     -- Fuzzy finder icon support
    opts = function()
      local fzf = require("fzf-lua")

      fzf.config.defaults.actions.files["ctrl-x"] = fzf.actions.file_split
      fzf.config.defaults.actions.files["ctrl-v"] = fzf.actions.file_vsplit
    end,
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

  ----------------------------------------------------------------------------- Completion, LSP

  'neovim/nvim-lspconfig',

  'williamboman/mason.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'enter' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      menu = {
        auto_show = true,
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true, auto_show_delay = 200 },
        list = { selection = { preselect = true, auto_insert = false } },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'omni' },
      },

      -- Disable cmdline completion
      cmdline = { enabled = false },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = true },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

  ----------------------------------------------------------------------------- Linting, formatting

  'stevearc/conform.nvim',
  'mfussenegger/nvim-lint',
})

-------------------------------------------------------------------------------
--- Post plugin install configurations
-------------------------------------------------------------------------------

require('lsp')
require('fmt')
require('linters')
