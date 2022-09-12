set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'bakudankun/pico-8.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ssteinbach/vim-pico8-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
set foldmethod=indent
set foldlevel=99
" Set tab = 4 spaces
set tabstop=4
" Allow buffer to be modified
set modifiable
set encoding=utf-8
" Set line numbers and allow clipboard use for copy-pasting
set nu
set clipboard=unnamed
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

nnoremap <space> za
au BufNewFile,BufRead *.py,*.c set
\ softtabstop=4
\ shiftwidth=4
\ textwidth=100
\ expandtab
\ autoindent
\ fileformat=unix

" Highlight bad whitespace as blue
highlight BadWhitespace ctermbg=blue guibg=blue
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.p8 match BadWhitespace /\s\+$/

" Set default colourscheme to Dracula
colorscheme dracula

" Custom command to save file and execute with Python3.
command Py :w <bar> exec'!python3 %'
" Custom command to run flake8 on current file in a horizontal window.
" TODO create a temporary buffer for this that is deleted upon closing.
command Flake :w <bar> let $name=expand('%') <bar> set splitbelow <bar> new <bar> r!flake8 --exit-zero $name

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
