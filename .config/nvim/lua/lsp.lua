-------------------------------------------------------------------------------
--- Install language parsers using TreeSitter
-------------------------------------------------------------------------------
local ts = require('nvim-treesitter')

ts.setup({})
ts.install({
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
  'svelte',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vue',
  'yaml',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-------------------------------------------------------------------------------
--- Install LSP configs and tools using Mason mason-lspconfig, mason-tool-installer
-------------------------------------------------------------------------------

require('mason').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    'typescript-language-server',
    'eslint_d',
    'prettierd',

    'lua-language-server',
    'stylua',

    'stylelint',
    'stylelint-lsp',

    'pgformatter',
    'postgres-language-server',
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
vim.lsp.config("sql", {})

vim.lsp.enable("bashls")
vim.lsp.enable("dockerls")
vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("sql")
vim.lsp.enable("stylelint_lsp")
vim.lsp.enable("svelte")
vim.lsp.enable("ts_ls")
