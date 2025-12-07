local conform = require('conform')

local tsx_jsx_linters = {
  'eslint_d',
  'prettierd',
  stop_after_first = true,
}

conform.setup({
  log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    javascript = tsx_jsx_linters,
    javascriptreact = tsx_jsx_linters,
    typescript = tsx_jsx_linters,
    typescriptreact = tsx_jsx_linters,
  },
})
