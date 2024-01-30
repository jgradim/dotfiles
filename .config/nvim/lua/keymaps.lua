local opts = function (desc)
  return { noremap = true, silent = true, desc = desc }
end

local keymap = vim.api.nvim_set_keymap

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
keymap('n', '<Leader>le', '<cmd> TroubleToggle document_diagnostics<CR>', opts('[LSP] Toggle document diagnostic messages'))
keymap('n', '<Leader>lw', '<cmd> TroubleToggle workspace_diagnostics<CR>', opts('[LSP] Toggle workspace diagnostic messages'))
-- keymap('n', '<Leader>lf', '<cmd> lua vim.lsp.buf.format()<CR>', opts('[LSP] Format current file with null-ls'))
keymap('n', '<Leader>lf', '<cmd> lua require("conform").format()<CR>', opts('[LSP] Format current file with conform.nvim'))
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)

-- telescope
keymap('n', '<C-p>', '<cmd> Telescope find_files<CR>', opts('[Telescope] Find files in current workspace')) -- FIXME: Crutch, remove in favour of <Leader>ff
keymap('n', '<Leader>fd', '<cmd> Telescope lsp_definitions<CR>', opts('[Telescope] Go to definition'))
keymap('n', '<Leader>ff', '<cmd> Telescope find_files hidden=true<CR>', opts('[Telescope] Find files in current workspace'))
keymap('n', '<Leader>fw', '<cmd> Telescope live_grep hidden=true<CR>', opts('[Telescope] Find search term in workspace'))

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
