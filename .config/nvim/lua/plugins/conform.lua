function config_conform()
  require('conform').setup({
    formatters_by_ft = {
      python = { 'isort', 'black' },
      javascript = { { 'eslint', 'prettierd', 'prettier' } },
      typescript = { { 'eslint', 'tsc', 'prettierd', 'prettier' } },
      typescriptreact = { { 'eslint', 'tsc', 'prettierd', 'prettier' } },
      terraform = { 'terraform_fmt' }
    }
  })
end
