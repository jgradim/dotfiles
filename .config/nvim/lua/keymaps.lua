local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap <Space> as leader key
keymap('', '<Space>', '<Nop>', opts)
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
keymap('n', '<Leader>tt', '<cmd> tabnew<CR>', opts)
keymap('n', '<D-t>', '<cmd> tabnew<CR>', opts) -- FIXME: Crutch, remove in favour of <Leader>tt

-- Session (CWD session.vim) management
keymap('n', '<Leader>sc', '<cmd> mksession! session.vim<CR>', opts)
keymap('n', '<Leader>sr', '<cmd> source session.vim<CR>', opts)

-- LSP
vim.keymap.set('', '<Leader>ll', require('lsp_lines').toggle, opts)
-- keymap('n', '<Leader<ll>', require("lsp_lines").toggle, opts)
keymap('n', '<Leader>le', '<cmd> TroubleToggle document_diagnostics<CR>', opts)
keymap('n', '<Leader>lw', '<cmd> TroubleToggle workspace_diagnostics<CR>', opts)

-- telescope
keymap('n', '<C-p>', '<cmd> Telescope find_files<CR>', opts) -- FIXME: Crutch, remove in favour of <Leader>ff
keymap('n', '<Leader>ff', '<cmd> Telescope find_files<CR>', opts)
keymap('n', '<Leader>fw', '<cmd> Telescope live_grep<CR>', opts)

-- trouble

-- Cursor movement with cmd key (Mac OS)
keymap('n', '<D-left>', 'b', opts)
keymap('i', '<D-left>', 'b', opts)
keymap('n', '<D-right>', 'w', opts)
keymap('i', '<D-right>', 'w', opts)

-- Arrow navigation in command line
-- cnoremap <C-P> <Up>
-- cnoremap <C-N> <Down>
keymap('c', '<C-P>', '<Up>', opts)
keymap('c', '<C-N>', '<Down>', opts)

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', opts)
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', opts)
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', opts)
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', opts)
