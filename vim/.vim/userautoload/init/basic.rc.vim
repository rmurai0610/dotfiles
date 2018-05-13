" General
let mapleader = "\<Space>"
syntax enable
set t_Co=256
set mouse=a
set mousehide
set number
set showmatch
set nowrap
set clipboard=unnamed
set wildmenu
set nohlsearch
set fillchars=""
set backspace=indent,eol,start
set sidescrolloff=5
set scrolloff=3
set wildmenu
set splitright
set splitbelow
set cursorline
set termguicolors

" Whitespace
set list
set listchars=trail:•
autocmd BufWritePre * :%s/\s\+$//e

" Indentations/Spaces
set nojoinspaces
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 expandtab

" Save undo info
let s:undo_dir = expand('~/.vim/undo')
if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
execute 'set undodir=' . s:undo_dir
set undofile

" No swap files
set noswapfile

" Close quickfix window automatically
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Neovim setting
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
