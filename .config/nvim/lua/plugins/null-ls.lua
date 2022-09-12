-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins

require('null-ls').setup({
  sources = {
    -- Bash
    require('null-ls').builtins.diagnostics.shellcheck,

    -- Lua
    require("null-ls").builtins.formatting.stylua,

    -- JS, TS, JSON
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.diagnostics.tsc,
    require("null-ls").builtins.diagnostics.jsonlint,

    -- Text / Markkdown
    require("null-ls").builtins.diagnostics.markdownlint,
    require("null-ls").builtins.completion.spell,
  },
})
