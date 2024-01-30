function config_lspconfig ()
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
  lspconfig.lua_ls.setup({})
  lspconfig.rust_analyzer.setup({
    settings = {
      cmd = "rustup run stable rust-analyzer"
    }
  })
  lspconfig.jedi_language_server.setup({})
  lspconfig.pyright.setup({})
  lspconfig.gdscript.setup({})
end
