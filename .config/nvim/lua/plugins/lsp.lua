require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls', -- Bash
    'cssls', -- CSS
    'cssmodules_ls', -- CSS Modules
    'dockerls', -- Docker
    'eslint', -- Eslint
    'elixirls', -- Elixir
    'graphql', -- GraphQL
    'html', -- HTML
    'jsonls', -- JSON
    'tsserver', -- Javascript / TypeScript
    'sumneko_lua', -- Lua
    'marksman', -- Markdown
    'prismals', -- Prisma
    'jedi_language_server', -- Python
    'pyright', -- Python
    'rust_analyzer', -- Rust
    'sqlls', -- SQL
    'taplo', -- TOML
    'terraformls', -- Terraform
    'yamlls', -- YAML
  }
})

require('lsp-colors').setup({})

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol('Error', '')
lspSymbol('Info', '')
lspSymbol('Hint', '')
lspSymbol('Warn', '')

vim.diagnostic.config {
  virtual_text = false,
  -- virtual_text = {
  --   -- prefix = '',
  --   prefix = "",
  -- },
  float = true,
  signs = true,
  underline = true,
  update_in_insert = false,
}

vim.o.updatetime = 200 -- default is 4000

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
    vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, { focusable = false })')
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

lspconfig.bashls.setup({})
lspconfig.dockerls.setup({})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.tsserver.setup({})
lspconfig.prismals.setup({})
lspconfig.terraformls.setup({})
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
})
lspconfig.rust_analyzer.setup({
  settings = {
    cmd = "rustup run stable rust-analyzer"
  }
})
lspconfig.jedi_language_server.setup({})
lspconfig.pyright.setup({})
lspconfig.gdscript.setup({})
lspconfig.yamlls.setup({})
