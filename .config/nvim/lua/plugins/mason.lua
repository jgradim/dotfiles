function config_mason_lspconfig ()
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
      'lua_ls', -- Lua
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
end
