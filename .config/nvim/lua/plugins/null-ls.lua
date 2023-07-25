-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins

-- local autogroup = vim.api.nvim_create_augroup('LspFormatting', {})

function config_null_ls ()
  local null_ls = require('null-ls')

  null_ls.setup({
    sources = {
      -- Bash
      null_ls.builtins.diagnostics.shellcheck,

      -- JS, TS, JSON
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.diagnostics.tsc,
      null_ls.builtins.diagnostics.jsonlint,
      null_ls.builtins.formatting.prettier,

      -- Terraform
      null_ls.builtins.diagnostics.terraform_validate,
      null_ls.builtins.formatting.terraform_fmt,

      -- Rust
      null_ls.builtins.formatting.rustfmt,

      -- Python
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,

      -- YAML
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.formatting.yamlfmt,
    },
  })
end
