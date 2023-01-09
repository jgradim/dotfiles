-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins

-- local autogroup = vim.api.nvim_create_augroup('LspFormatting', {})

require('null-ls').setup({
  sources = {
    -- Bash
    require('null-ls').builtins.diagnostics.shellcheck,

    -- Lua
    -- require("null-ls").builtins.formatting.stylua,

    -- JS, TS, JSON
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.diagnostics.tsc,
    require("null-ls").builtins.diagnostics.jsonlint,
    require("null-ls").builtins.formatting.prettier,

    -- Rust
    require("null-ls").builtins.formatting.rustfmt,

    -- Text / Markdown
    -- require("null-ls").builtins.diagnostics.markdownlint,
    -- require("null-ls").builtins.completion.spell,

    -- Python
    require("null-ls").builtins.formatting.isort,
    require("null-ls").builtins.formatting.black,

    -- YAML
    require("null-ls").builtins.diagnostics.yamllint,
    require("null-ls").builtins.formatting.yamlfmt,
  },

  -- on_attach = function(client, bufnr)
  --   if client.supports_method('textDocument/formatting') then
  --     vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd('BufWritePre', {
  --       group = autogroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
  -- end
})
