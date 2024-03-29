set nocompatible              " be iMproved, required
filetype off                  " required

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
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

nnoremap <space> za
au BufNewFile,BufRead *.py,*.c set
\ softtabstop=4
\ shiftwidth=4
\ textwidth=100
\ expandtab
\ autoindent
\ fileformat=unix

colorscheme dracula

" Highlight bad whitespace as green
highlight BadWhitespace ctermbg=green guibg=green
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Custom command to save file and execute with Python3.
command Py :w <bar> exec'!python3 %'
" Custom command to run flake8 on current file in a horizontal window.
" TODO create a temporary buffer for this that is deleted upon closing.
command Flake :w <bar> let $name=expand('%') <bar> set splitbelow <bar> new <bar> r!flake8 --exit-zero $name

" Put your non-Plugin stuff after this line

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

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

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

