function config_lualine ()
  require('lualine').setup({
    options = {
      theme = 'nord',
    },
    sections = {
      lualine_b = {'diagnostics'},
      lualine_c = { {
        'filename',
        path = 1
      } },
    },
    inactive_sections = {
      lualine_c = {'filename'}
    },
  })
end
