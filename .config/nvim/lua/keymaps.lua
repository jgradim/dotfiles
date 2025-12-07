local opts = function (desc)
  return { noremap = true, silent = true, desc = desc }
end

local keymap = vim.api.nvim_set_keymap

local virtual_lines = false
local toggle_virtual_lines = function ()
  virtual_lines = not virtual_lines

  if virtual_lines then
    vim.diagnostic.config({ virtual_lines = { current_line = false } })
  else
    vim.diagnostic.config({ virtual_lines = false })
  end
end

---- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- New Tab
keymap('n', '<Leader>tt', '<cmd> tabnew<CR>', opts('New tab'))
keymap('n', '<D-t>', '<cmd> tabnew<CR>', opts('New tab')) -- FIXME: Crutch, remove in favour of <Leader>tt

-- Set wrap / unwrap
keymap('n', '<Leader>ww', '<cmd> set wrap!<CR>', opts('Toggle text wrapping'))

-- treesj (splitjoin.vim)
keymap('n', '<Leader>ss', '<cmd> TSJSplit<CR>', opts('[TreeSJ]: Split node under cursor'))
keymap('n', '<Leader>sj', '<cmd> TSJJoin<CR>', opts('[TreeSJ]: Join node under cursor'))

-- Session (CWD session.vim) management
keymap('n', '<Leader>sc', '<cmd> mksession! session.vim<CR>', opts('Write current session to ./session.vim'))
keymap('n', '<Leader>sr', '<cmd> source session.vim<CR>', opts('Restore session from ./session.vim'))

-- LSP
keymap('n', '<Leader>lr', '<cmd> LspRestart<CR>', opts('[LSP] Restart server'))

vim.keymap.set('n', '<leader>le', toggle_virtual_lines)

-- Formatting
keymap('n', '<Leader>lf', '<cmd> lua require("conform").format()<CR>', opts('[LSP] Format current file with conform.nvim'))

-- fzf-lua
keymap('n', '<C-p>', '<cmd> FzfLua files<CR>', opts('[fzf-lua] Find files in current workspace'))
keymap('n', '<Leader>ff', '<cmd> FzfLua files<CR>', opts('[fzf-lua] Find files in current workspace'))
keymap('n', '<Leader>fw', '<cmd> FzfLua grep_project<CR>', opts('[fzf-lua] Find search term in workspace'))

-- Copy / paste to / from system clipboard w/ <Leader>c / <Leader>v
vim.keymap.set({ 'v', 'x'}, '<Leader>c', '"*y<CR>', opts('Copy visual selection to system clipboard'))
keymap('n', '<Leader>v', '<cmd> set paste<CR>"*p:set nopaste<CR>', opts('Paste from system clipboard'))

-- Cursor movement with cmd key (Mac OS)
keymap('n', '<D-left>', 'b', opts('motion: b'))
keymap('i', '<D-left>', 'b', opts('motion: b'))
keymap('n', '<D-right>', 'w', opts('motion: w'))
keymap('i', '<D-right>', 'w', opts('motion: w'))

-- Arrow navigation in command line
-- cnoremap <C-P> <Up>
-- cnoremap <C-N> <Down>
-- keymap('c', '<C-P>', '<Up>', opts())
-- keymap('c', '<C-N>', '<Down>', opts())

-- increase / decrease / reset font size
vim.keymap.set({ 'n', 'i' }, '<D-=>', function() ChangeGuiFontSize(1) end, opts())
vim.keymap.set({ 'n', 'i' }, '<D-->', function() ChangeGuiFontSize(-1) end, opts())
vim.keymap.set({ 'n', 'i' }, '<D-0>', function() ChangeGuiFontSize(0) end, opts())

-- Allow clipboard copy paste in neovim
keymap('', '<D-v>', '+p<CR>', opts())
keymap('!', '<D-v>', '<C-R>+', opts())
keymap('t', '<D-v>', '<C-R>+', opts())
keymap('v', '<D-v>', '<C-R>+', opts())
