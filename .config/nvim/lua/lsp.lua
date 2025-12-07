-------------------------------------------------------------------------------
--- Install language parsers using TreeSitter
-------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup({
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'gdscript',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'glsl',
    'go',
    'hcl',
    'html',
    'javascript',
    'json',
    'json5',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'regex',
    'scss',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true }
})

-------------------------------------------------------------------------------
--- Install LSP configs and tools using Mason mason-lspconfig, mason-tool-installer
-------------------------------------------------------------------------------

require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'eslint_d',
    'lua-language-server',
    'prettierd',
    'stylua',
    'typescript-language-server',
  }
})

-------------------------------------------------------------------------------
--- Configure completion and LSP sources
-------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = {
    current_line = false,
  },
})

vim.lsp.config('*', {
  flags = {
    debounce_text_changes = 150,
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        }
      }
    }
  }
})
vim.lsp.enable("lua_ls")

vim.lsp.enable("bashls")
vim.lsp.enable("dockerls")
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")

