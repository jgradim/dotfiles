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
