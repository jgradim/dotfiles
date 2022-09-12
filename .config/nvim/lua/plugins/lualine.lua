local function file_path()
end

require('lualine').setup({
  options = {
    -- theme = 'wombat',
    theme = 'nord',
  },
  sections = {
    lualine_c = { {
      'filename',
      path = 1
    } },
  },
  inactive_sections = {
    lualine_c = {'filename'}
  },
})
