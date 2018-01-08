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
  Plug 'ervandew/supertab'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-eunuch'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'vim-scripts/Align'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'tpope/vim-abolish'
  Plug 'w0rp/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'rust-lang/rust.vim'

  " Language Server Protocol (LSP) support
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'maralla/completor.vim'

  " syntax highlight
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx'] }
  Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'javascript.jsx' ] }
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': [ 'javascript', 'javascript.jsx' ] }
  Plug 'keith/swift.vim', { 'for': 'swift' }
  Plug 'hhsnopek/vim-sugarss'
  Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  Plug 'cespare/vim-toml', { 'for': 'toml' }

  " colors
  Plug 'jgradim/neodark.vim'

call plug#end()
" filetype plugin indent on       " required!

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
set softtabstop=2 shiftwidth=2
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

"" LSP configuration
if executable('rls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
    \ 'whitelist': ['rust'],
    \ })
endif

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
    \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
    \ })
endif

"" Plugin configuration

  " ctrlp
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_working_path_mode = 'a'

  " indentLine
  let g:indentLine_char = '⎸'
  "let g:indent_guides_enable_on_vim_startup = 1
  "let g:indent_guides_guide_size = 1

  " lightline
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filepath', 'modified' ]
      \   ]
      \ },
      \ 'component': {
      \   'helloworld': 'Hello, world!'
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

"" custom filetypes
au BufRead,BufNewFile *.rabl* setf ruby
au BufRead,BufNewFile Vagrantfile setf ruby
au BufRead,BufNewFile *.less* setf sass
au BufRead,BufNewFile *.styl* setf sass
au BufRead,BufNewFile *.hamlbars* setf haml
au BufRead,BufNewFile *.hbs setf html
