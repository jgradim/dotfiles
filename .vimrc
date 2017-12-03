"" Use Vim settings, not Vi

"" This must be first, because it changes other options as a side effect
set nocompatible 

"" Vundler
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required!)
Plugin 'VundleVim/Vundle.vim'

" Plugins (bundles) - published on github, for automatic management with vundle

  " plugins
  Plugin 'ervandew/supertab'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-eunuch'
  Plugin 'Raimondi/delimitMate'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'mattn/emmet-vim'
  Plugin 'Align'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'tpope/vim-abolish'
  Plugin 'w0rp/ale'
  Plugin 'itchyny/lightline.vim'

  " syntax highlight
  Plugin 'tpope/vim-markdown'
  Plugin 'tpope/vim-rails'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'MaxMEllon/vim-jsx-pretty'
  Plugin 'keith/swift.vim'
  Plugin 'hhsnopek/vim-sugarss'
  Plugin 'elixir-lang/vim-elixir'

  " colors
  Plugin 'jgradim/neodark.vim'

call vundle#end()
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

"" Plugin configuration

  " ctrlp
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_working_path_mode = 'a'

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
        \ }
        \ }

  function! FilePath()
    let path = expand('%:p')
    return substitute(path, getcwd()."/", '', 'i')
  endfunction

  " vim-jsx (allow JSX syntax highlight in .js files)
  let g:jsx_ext_required = 0

  " vim-jsx-pretty
  let g:vim_jsx_pretty_colorful_config = 1

"" custom filetypes
au BufRead,BufNewFile *.rabl* setf ruby
au BufRead,BufNewFile Vagrantfile setf ruby
au BufRead,BufNewFile *.less* setf sass
au BufRead,BufNewFile *.styl* setf sass
au BufRead,BufNewFile *.hamlbars* setf haml
au BufRead,BufNewFile *.hbs setf html
