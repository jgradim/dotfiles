"" Use Vim settings, not Vi

"" This must be first, because it changes other options as a side effect
set nocompatible

"" Auto load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/autoload/; curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"" vim-plug
call plug#begin("~/.vim/plugged")

" Plugins

  " plugins
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'raimondi/delimitmate'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/Align'
  Plug 'w0rp/ale'

  " auto-completion / language servers
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " syntax highlight / language support
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': [ 'javascript', 'javascript.jsx' ] }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
  Plug 'hhsnopek/vim-sugarss'
  Plug 'jdonaldson/vaxe', { 'for': [ 'haxe', 'hss' ] }
  Plug 'keith/swift.vim', { 'for': 'swift' }
  Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx'] }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }

  " colors
  Plug 'jgradim/neodark.vim'

call plug#end()

filetype plugin indent on       " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" General options
set number                      " always show line numbers
set backspace=indent,eol,start  " backspace on everything
set encoding=utf-8              " default encoding for all files
set showcmd                     " display incomplete commands
set showmode                    " show current mode
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show the status line

"" Syntax highlight
syntax enable

"" Tab settings
set softtabstop=2 shiftwidth=2 tabstop=2
set expandtab

"" Indentation
set autoindent
set smartindent
set smarttab

"" Searching
set hlsearch                    " highlight searches
set incsearch                   " incremental search
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Whitespace
set nowrap                      " don't wrap lines
set linebreak                   " wrap lines at convenient places

"" Scrolling
set scrolloff=2                 " start scrolling when we're 2 lines away from margins

"" Turn off Swap Files
set noswapfile
set nobackup
set nowb

"" Mouse/trackpad scrolling in terminal Vim
set mouse=a

"" Hide mode, using lightline
set noshowmode

"" Color theme
colorscheme neodark

"" Global ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"" Disable Ex mode
nnoremap Q <Nop>

"" coc.nvim configuration
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"" Plugin configuration

  " ctrlp
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_working_path_mode = 'a'

  " indentLine
  " let g:indentLine_char = '⎸'

  " lightline
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filepath', 'modified' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'filepath': 'FilePath'
      \ },
      \ }

  function! FilePath()
    let path = expand('%:p')
    return substitute(path, getcwd()."/", '', 'i')
  endfunction

  " emmet
  let g:user_emmet_settings = {
      \ 'javascript' : {
      \   'extends' : 'jsx',
      \ },
      \ }

  " vim-jsx (allow JSX syntax highlight in .js files)
  let g:jsx_ext_required = 0

  " vim-jsx-pretty
  let g:vim_jsx_pretty_colorful_config = 1

  " rust-vim
  let g:autofmt_autosave = 1

  " ALE
  let g:ale_elixir_elixir_ls_release = '~/work/elixir-ls/rel'

"" custom filetypes
au BufRead,BufNewFile *.hamlbars* setf haml
au BufRead,BufNewFile *.hbs setf html
au BufRead,BufNewFile *.less* setf sass
au BufRead,BufNewFile *.rabl* setf ruby
au BufRead,BufNewFile *.styl* setf sass
au BufRead,BufNewFile .env setf sh
au BufRead,BufNewFile .env.* setf sh
au BufRead,BufNewFile Vagrantfile setf ruby
au BufRead,BufNewFile .eslintrc setf javascript
