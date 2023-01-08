local opts = function (desc)
  return { noremap = true, silent = true, desc = desc }
end

local keymap = vim.api.nvim_set_keymap

-- Remap <Space> as leader key
keymap('', '<Space>', '<Nop>', opts())
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
keymap('n', '<Leader>ss', '<cmd> TSJSplit<CR>', opts('treesj: Split node under cursor'))
keymap('n', '<Leader>sj', '<cmd> TSJJoin<CR>', opts('treesj: Join node under cursor'))

-- Session (CWD session.vim) management
keymap('n', '<Leader>sc', '<cmd> mksession! session.vim<CR>', opts('Write current session to ./session.vim'))
keymap('n', '<Leader>sr', '<cmd> source session.vim<CR>', opts('Restore session from ./session.vim'))

-- LSP
keymap('n', '<Leader>lr', '<cmd> LspRestart<CR>', opts('Restart LSP server'))
keymap('n', '<Leader>le', '<cmd> TroubleToggle document_diagnostics<CR>', opts('Toggle document diagnostic messages'))
keymap('n', '<Leader>lw', '<cmd> TroubleToggle workspace_diagnostics<CR>', opts('Toggle workspace diagnostic messages'))
keymap('n', '<Leader>lf', '<cmd> lua vim.lsp.buf.format()<CR>', opts('Format current file with null-ls'))
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)

-- telescope
keymap('n', '<C-p>', '<cmd> Telescope find_files<CR>', opts('Find files in current workspace')) -- FIXME: Crutch, remove in favour of <Leader>ff
keymap('n', '<Leader>ff', '<cmd> Telescope find_files<CR>', opts('Find files in current workspace'))
keymap('n', '<Leader>fw', '<cmd> Telescope live_grep<CR>', opts('Find search term in files in current workspace'))

-- trouble

-- Cursor movement with cmd key (Mac OS)
keymap('n', '<D-left>', 'b', opts('motion: b'))
keymap('i', '<D-left>', 'b', opts('motion: b'))
keymap('n', '<D-right>', 'w', opts('motion: w'))
keymap('i', '<D-right>', 'w', opts('motion: w'))

-- Arrow navigation in command line
-- cnoremap <C-P> <Up>
-- cnoremap <C-N> <Down>
-- keymap('c', '<C-P>', '<Up>', opts)
-- keymap('c', '<C-N>', '<Down>', opts)

-- increase / decrease / reset font size
vim.keymap.set({ 'n', 'i' }, '<D-=>', function() ChangeGuiFontSize(1) end, opts())
vim.keymap.set({ 'n', 'i' }, '<D-->', function() ChangeGuiFontSize(-1) end, opts())
vim.keymap.set({ 'n', 'i' }, '<D-0>', function() ChangeGuiFontSize(0) end, opts())

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
keymap('', '<D-v>', '+p<CR>', opts())
keymap('!', '<D-v>', '<C-R>+', opts())
keymap('t', '<D-v>', '<C-R>+', opts())
keymap('v', '<D-v>', '<C-R>+', opts())
