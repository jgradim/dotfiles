-- General options
vim.o.number = true                     -- always show line numbers
vim.o.backspace = 'indent,eol,start'  -- backspace on everything
vim.o.encoding = 'utf-8'              -- default encoding for all files
vim.o.showcmd = true                     -- display incomplete commands
vim.o.showmode = true                   -- show current mode
vim.o.autoread = true                    -- Reload files changed outside vim
vim.o.laststatus = 2                -- Always show the status line
vim.o.signcolumn = 'yes'

-- Tab settings
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true

-- Searching
vim.o.hlsearch = true                    -- highlight searches
vim.o.incsearch = true                   -- incremental search
vim.o.ignorecase = true                  -- searches are case insensitive...
vim.o.smartcase = true                   -- ... unless they contain at least one capital letter

-- Whitespace
vim.o.wrap = false                      -- don't wrap lines
vim.o.linebreak = true                   -- wrap lines at convenient places

-- Scrolling
vim.o.scrolloff = 2               -- start scrolling when we're 2 lines away from margins

-- Turn off Swap Files
vim.o.swapfile = false
vim.o.backup = false
vim.o.wb = false

-- Mouse/trackpad scrolling in terminal Vim
vim.o.mouse = 'a'

-- GUI settings
vim.o.guifont = 'FiraCode Nerd Font:h13'

FONT_SIZE = 13
CHANGE_GUI_FONT_SIZE = function(delta)
  if delta == 0 then
    FONT_SIZE = 13
  end
  FONT_SIZE = FONT_SIZE + delta

  vim.o.guifont = string.format('FiraCode Nerd Font:h%s', FONT_SIZE)
end
