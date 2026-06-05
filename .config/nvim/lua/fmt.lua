local conform = require('conform')

local tsx_jsx_linters = {
  'prettierd',
  'prettier',
  'eslint_d',
  -- stop_after_first = true,
}

local tf_linters = {
  'terraform_fmt'
}

conform.setup({
  log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    javascript = tsx_jsx_linters,
    javascriptreact = tsx_jsx_linters,
    typescript = tsx_jsx_linters,
    typescriptreact = tsx_jsx_linters,
    css = { 'stylelint' },
    terraform = tf_linters,
    tf = tf_linters,
    hcl = tf_linters,
    ["terraform-vars"] = tf_linters,
  },
})
