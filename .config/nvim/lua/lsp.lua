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
require('mason-lspconfig').setup({
  ensure_installed = {
    -- "ast_grep",  -- C#, C++, C, CSS, Dart, Go, HTML, Java, Javascript, JSX, Kotlin
    "bashls",    -- shell script
    "dockerls",  -- Dockerfile
    "eslint",    -- JS / TS
    "lua_ls",    -- Lua
    "ts_ls",     -- TypeScript
  },
})
require('mason-tool-installer').setup({
  ensure_installed = {
    'eslint_d',
  }
})

-------------------------------------------------------------------------------
--- Configure completion and LSP sources
-------------------------------------------------------------------------------

local blink = require('blink.cmp')
local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  {
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = blink.get_lsp_capabilities()
  }
)

lspconfig.bashls.setup({})
lspconfig.docker.setup({})
lspconfig.eslint.setup({})
-- lspconfig.gdscript.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
lspconfig.ts_ls.setup({})
