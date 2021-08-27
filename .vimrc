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
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mattn/emmet-vim'
  Plug 'raimondi/delimitmate'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/Align'
  Plug 'dense-analysis/ale'

  " auto-completion / language servers
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1

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
  Plug 'calviken/vim-gdscript3', { 'for': 'gdscript' }
  Plug 'evanleck/vim-svelte', { 'branch': 'main' }

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

" maximum number of open tabs (vim -p)
set tabpagemax=50

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
      \ 'inactive': {
      \   'left': [['filepath']]
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

  " vim-svelte
  let g:svelte_indent_script = 0
  let g:svelte_indent_style = 0

  " ALE
  let g:ale_linters = {
    \ 'typescript': ['eslint'],
    \ 'javascript': ['eslint'],
    \ }
  let g:ale_javascript_eslint_suppress_missing_config = 1

"" custom filetypes
au BufRead,BufNewFile *.hamlbars* setf haml
au BufRead,BufNewFile *.hbs setf html
au BufRead,BufNewFile *.less* setf sass
au BufRead,BufNewFile *.rabl* setf ruby
au BufRead,BufNewFile *.styl* setf sass
au BufRead,BufNewFile *.p8* setf lua
au BufRead,BufNewFile *.p8* set colorcolumn=32
au BufRead,BufNewFile .env setf sh
au BufRead,BufNewFile .env.* setf sh
au BufRead,BufNewFile Vagrantfile setf ruby
au BufRead,BufNewFile .eslintrc setf javascript
