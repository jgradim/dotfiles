local lint = require('lint')

local tsx_jsx_linters = {
  'eslint_d',
}

lint.linters_by_ft = {
  javascript = tsx_jsx_linters,
  javascriptreact = tsx_jsx_linters,
  typescript = tsx_jsx_linters,
  typescriptreact = tsx_jsx_linters,
}
